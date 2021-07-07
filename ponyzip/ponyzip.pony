use "debug"
use "collections"

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

use @printf[I32](...)

class PonyZip
  var zip: NullablePointer[Zip] = NullablePointer[Zip].none()
  var errorno: I32 = 0
  var errorstr: String = ""
  var initflags: I32 = 0

  new create(filename: String, flags: Array[ZipFlags]) =>
    initflags = zfflags(flags)

    var errno: Array[I32] = [I32(42)]
    zip = ABLibZIP.pzip_open(filename, initflags, errno.cpointer())

    if (zip.is_none()) then
      try
        errorno = errno.apply(0)?
        var ziperr: Ziperror = Ziperror
        var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)

        ABLibZIP.pzip_error_init_with_code(ziperrp, errorno)
        errorstr = ABLibZIP.pzip_error_strerror(ziperrp)
      end
    end

  fun valid(): Bool =>
    if (zip.is_none()) then
      false
    else
      true
    end

  fun zfflags(flags: Array[ZipFlags]): I32 =>
    var rv: I32 = 0
    for f in flags.values() do
      rv = rv+f.apply()
    end
    rv

  fun zfflflags(flags: Array[ZipFLFlags]): U32 =>
    var rv: U32 = 0
    for f in flags.values() do
      rv = rv+f.apply()
    end
    rv


  fun ref count(flags: Array[ZipFLFlags] = []): USize ? =>
    if (zip.is_none()) then
      error
    else
      ABLibZIP.pzip_get_num_entries(zip, zfflflags(flags)).usize()
    end


  fun ref filesdata(): Array[Zipstat] ? =>
    var cnt: USize = this.count([])? // FIXME ?

    var rv: Array[Zipstat] = Array[Zipstat]

    for i in Range(0,cnt) do
      rv.push(zip_stat_index(i)?)
    end
    rv

  fun zip_stat_index(index: USize): Zipstat ? =>
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
    if (zipstat.pencryptionmethod != ZipEMNone.apply()) then
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

  fun close(): None =>
    ABLibZIP.pzip_close(zip)


