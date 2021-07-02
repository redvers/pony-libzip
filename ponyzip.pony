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
      var zfile: Zipstat = Zipstat
      var zfilep: NullablePointer[Zipstat] = NullablePointer[Zipstat](zfile)
      var ii: I32 = ABLibZIP.pzipstatindex(zip, i.u64(), U32(0), zfilep)
      rv.push(zfile)
//      var fn: String = String.from_cstring(zfile.pname).clone()
//      Debug.out(fn + ": " + zfile.pcompsize.string() + "b -> " + zfile.psize.string() + "b")
    end
    rv
