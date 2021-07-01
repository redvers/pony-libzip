use "collections"
use "../../pony-libzip"

actor Main
  new create(env: Env) =>
    env.out.print("Hello World")

    // fun pzipopen(pparg0: String, pparg1: I32, pparg2: Pointer[I32]): NullablePointer[Zip] =>
    var filename: String = "test.zip"

    var errorno: Array[I32] = [I32(42)]
    var errornop: Pointer[I32] tag = errorno.cpointer()
    var zip: NullablePointer[Zip] = ABLibZIP.pzipopen(filename, I32(0), errornop)

    if (zip.is_none()) then
      var ziperr: Ziperror = Ziperror
      var ziperrp: NullablePointer[Ziperror] = NullablePointer[Ziperror](ziperr)

      // fun pziperrorinitwithcode(pparg0: NullablePointer[Ziperror], pparg1: I32): None =>
      try
        var err: I32 = errorno.apply(0)?
        ABLibZIP.pziperrorinitwithcode(ziperrp, err)
        //
        // fun pziperrorstrerror(pparg0: NullablePointer[Ziperror]): String =>
        var errorstr: String = ABLibZIP.pziperrorstrerror(ziperrp)
        env.out.print("This file: " + filename + " did not open -> " + errorstr)
      end
    else
      var count: USize = ABLibZIP.pzipgetnumentries(zip, U32(0)).usize()
      env.out.print("Number of items: " + count.string())

      for f in Range(0, count) do
        // fun pzipstatindex(pparg0: NullablePointer[Zip], pparg1: U64, pparg2: U32, pparg3: NullablePointer[Zipstat]): I32 =>
        var zfile: Zipstat = Zipstat
        var zfilep: NullablePointer[Zipstat] = NullablePointer[Zipstat](zfile)
        ABLibZIP.pzipstatindex(zip, f.u64(), U32(0), zfilep)

        env.out.print(String.from_cstring(zfile.pname).clone() + "comp size=" + zfile.pcompsize.string() + ", uncomp= " + zfile.psize.string())

      end
    end
// ziperr = zip_error_init_with_code(zip, errno)
// zip_error_strerror(ziperr)
//
// zip_get_num_entries
// zip_stat_index
//
//

