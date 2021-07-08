"""
# PonyZip Package

This package consists of two APIs:

1. ABLibZIP - A direct 1:1 mapping of the libzip C API to Pony C-FFI calls.
2. PonyZip - A safer 'Ponyesque' API which is designed to not crash if you
do something which is not safe or supported.

As a general rule you should prefer the PonyZip API over ABLibZIP and only
use ABLibZIP if one of the functions you need isn't implemented.

If there is functionality that is missing the PonyZip that is present in
ABLibZIP please either open an Issue to request it or a Pull Request to add
it.
"""

use "debug"
use "collections"

use @printf[I32](...)

class PonyZip
  var zip: NullablePointer[Zip] = NullablePointer[Zip].none()
  var errortype: ZipER = ZipEROK
  var errorstr: String = ""
  var initflags: U32 = 0

  new create(filename: String, flags: ZipFlags) =>
    """
    The create() constructor opens the zip archive specified by filename and
    returns a PonyZip object instance.

    The flags available are:
    * ZipCheckcons Perform additional stricter consistency checks on the
    archive, and error if they fail.
    * ZipCreate Create the archive if it does not exist.
    * ZipExcl Error if archive already exists.
    * ZipTruncate If archive exists, ignore its current contents. In other
    words, handle it the same way as an empty archive.
    * ZipRDOnly Open archive in read-only mode.

    After creation you should immediately verify that the creation was
    successful by calling the valid() function.
    """
    initflags = flags.value()

    var errno: Array[I32] = [I32(0)]
    zip = ABLibZIP.pzip_open(filename, initflags, errno.cpointer())

    if (zip.is_none()) then
      try
        var errorno = errno.apply(0)?
        var ziperr: Ziperror = Ziperror
        var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)
        errortype = ZipERR.decode(errorno)

        ABLibZIP.pzip_error_init_with_code(ziperrp, errorno)
        errorstr = ABLibZIP.pzip_error_strerror(ziperrp)
      end
    end

  fun valid(): Bool =>
    """
    Validatates if the associated open* creator was successful in opening
    the specified zip archive.  Returns boolean true/false.

    If creation was unsuccessful, the cause of the error can be accessed
    via the errorstr field.
    """
    if (zip.is_none()) then
      false
    else
      true
    end

  fun count(flags: ZipFLFlags = ZipFLFlags): USize ? =>
    """
    Returns the total number of entries in the provided zip archive.
    """
    if (zip.is_none()) then
      error
    else
      ABLibZIP.pzip_get_num_entries(zip, flags.value()).usize()
    end

  fun zip_stat_index(index: USize): Zipstat ? =>
    """
    Returns a Zipstat struct containing the file metadata for the file at
    the provided index value.
    """
    if (zip.is_none()) then
      error
    end
    var zfile: Zipstat = Zipstat
    var zfilep: NullablePointer[Zipstat] = NullablePointer[Zipstat](zfile)
    var ii: I32 = ABLibZIP.pzip_stat_index(zip, index.u64(), U32(0), zfilep)
    if (zfilep.is_none()) then
      error
    else
      zfile
    end

  fun ref readfile(zipstat: Zipstat): Array[U8] iso^ ? =>
    """
    Returns the contents of the file defined by the provided
    Zipstat.  Currently only supports unencrypted files.
    """
    if (zipstat.pencryptionmethod != ZipEMNone.value()) then
      error  // We should probably automatically call
             // a decrypt function here... cos we're nice
    end
    let bytes: USize = zipstat.size()
    Debug.out("CompressedFilesize: " + zipstat.compsize().string())
    Debug.out("Filesize: " + bytes.string())

    var zf: NullablePointer[Zipfile] = ABLibZIP.pzip_fopen_index(zip, zipstat.index().u64(), U32(0))
    if (zf.is_none()) then
      error
    end

    var data: Array[U8] iso = recover iso Array[U8].>undefined(bytes) end
    var cnt: I64 = ABLibZIP.pzip_fread(zf, data.cpointer(), bytes.u64())
    Debug.out("Read: " + cnt.string() + " bytes out of " + bytes.string())
    consume data

  fun ref add_file(filename: String, data: Array[U8] val, flags: Array[ZipFLFlags]): USize ? =>
    """
    Adds the contents of the provided data-field to the archive
    with the specified filename.

    This is a convenience function which combines Source creation
    and file addition.
    """
    if (zip.is_none()) then
      error
    end

    var ziperr: Ziperror = Ziperror
    var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)
    let zs: NullablePointer[Zipsource] = ABLibZIP.pzip_source_buffer_create(data.cpointer(), data.size().u64(), I32(1), ziperrp)
    if (zs.is_none()) then
      errorstr = ABLibZIP.pzip_error_strerror(ziperrp)
      error
    end
    ABLibZIP.pzip_file_add(zip, filename, zs, U32(0)).usize() // FIXME
    //// Check here for -1 too for writing issues...

  fun close(): I32 =>
    """
    Closes the specified archive. Will not complete until any changes
    to the archive have been committed to disk.

    Success results in a return-code of 0.
    """
    ABLibZIP.pzip_close(zip)

