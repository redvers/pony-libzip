use "debug"
use "collections"

use @printf[I32](...)

class PonyZip
  var zip: NullablePointer[Zip] = NullablePointer[Zip].none()
  var errorno: I32 = 0
  var errorstr: String = ""
  var initflags: I32 = 0

  new create(filename: String, flags: Array[ZipFlags]) =>
    initflags = zfflags(flags)

    var errno: Array[I32] = [I32(42)]
    zip = ABLibZIP.pzipopen(filename, initflags, errno.cpointer())

    if (zip.is_none()) then
      try
        errorno = errno.apply(0)?
        var ziperr: Ziperror = Ziperror
        var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)

        ABLibZIP.pziperrorinitwithcode(ziperrp, errorno)
        errorstr = ABLibZIP.pziperrorstrerror(ziperrp)
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
      ABLibZIP.pzipgetnumentries(zip, zfflflags(flags)).usize()
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
    var ii: I32 = ABLibZIP.pzipstatindex(zip, index.u64(), U32(0), zfilep)
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

    var zf: NullablePointer[Zipfile] = ABLibZIP.pzipfopenindex(zip, zipstat.index().u64(), U32(0))
    if (zf.is_none()) then
      error
    end

    var data: Array[U8] iso = recover iso Array[U8].>undefined(bytes) end
    var cnt: I64 = ABLibZIP.pzipfread(zf, data.cpointer(), bytes.u64())
    Debug.out("Read: " + cnt.string() + " bytes out of " + bytes.string())
    consume data

  fun ref add_file(filename: String, data: Array[U8] val, flags: Array[ZipFLFlags]): USize ? =>
    if (zip.is_none()) then
      error
    end

    var ziperr: Ziperror = Ziperror
    var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)
    let zs: NullablePointer[Zipsource] = ABLibZIP.pzipsourcebuffercreate(data.cpointer(), data.size().u64(), I32(1), ziperrp)
    if (zs.is_none()) then
      errorstr = ABLibZIP.pziperrorstrerror(ziperrp)
      error
    end
    ABLibZIP.pzipfileadd(zip, filename, zs, U32(0)).usize() // FIXME
    //// Check here for -1 too for writing issues...

  fun close(): None =>
    ABLibZIP.pzipclose(zip)


