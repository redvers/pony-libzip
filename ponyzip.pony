use "debug"
use "collections"

class PonyZip
  var zip: NullablePointer[Zip] = NullablePointer[Zip].none()
  var errorno: I32 = 0
  var errorstr: String = ""
  var valid: Bool = false

  new openRO(filename: String) =>
    var errno: Array[I32] = [I32(42)]
    zip = ABLibZIP.pzipopen(filename, I32(16), errno.cpointer())

    if (zip.is_none()) then
      try
        errorno = errno.apply(0)?
        var ziperr: Ziperror = Ziperror
        var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)

        ABLibZIP.pziperrorinitwithcode(ziperrp, errorno)
        errorstr = ABLibZIP.pziperrorstrerror(ziperrp)
      end
    else
      valid = true
    end

  fun ref count(): USize ? =>
    if (valid) then
      ABLibZIP.pzipgetnumentries(zip, U32(0)).usize()
    else
      error
    end


  fun ref filesdata(): Array[Zipstat] ? =>
    var cnt: USize = this.count()?

    var rv: Array[Zipstat] = Array[Zipstat]

    for i in Range(0,cnt) do
      rv.push(from_index(i)?)
    end
    rv

  fun from_index(index: USize): Zipstat ? =>
    var zfile: Zipstat = Zipstat
    var zfilep: NullablePointer[Zipstat] = NullablePointer[Zipstat](zfile)
    var ii: I32 = ABLibZIP.pzipstatindex(zip, index.u64(), U32(0), zfilep)
    if (zfilep.is_none()) then
      error
    else
      zfile
    end

  fun ref readfile(zipstat: Zipstat): Array[U8] iso^ ? =>
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


