use "ponytest"
use "collections"

actor Main is TestList
    new create(env: Env) => PonyTest(env, this)
    new make() => None

      fun tag tests(test: PonyTest) =>
      test(_TestZipOpen)



class iso _TestZipOpen is UnitTest
  fun name(): String => "PonyZip/zip_open"

  fun apply(h: TestHelper) ? =>
    let rdf: ZipFlags = ZipFlags.>set(ZipRDOnly).>set(ZipCheckcons)
    h.assert_eq[U32](rdf.value(), 20)
    let nofilezip: PonyZip = PonyZip("idonotexist.zip", rdf)
    h.assert_false(nofilezip.valid())
    h.assert_eq[String](nofilezip.errorstr, "No such file")
    h.assert_eq[I32](nofilezip.errortype.value(), 9)

    let rdzip: PonyZip = PonyZip("test.zip", rdf)
    h.assert_true(rdzip.valid())
    h.assert_eq[String](rdzip.errorstr, "")
    h.assert_eq[I32](rdzip.errortype.value(), 0)

    let rdzipcnt: USize = rdzip.count()?
    h.assert_eq[USize](rdzipcnt, 15)

    h.assert_eq[String](rdzip.zip_stat_index(0)?.name(), "CXMLArrayType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(1)?.name(), "CXMLCvQualifiedType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(2)?.name(), "CXMLElaboratedType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(3)?.name(), "CXMLEnumeration.pony")
    h.assert_eq[String](rdzip.zip_stat_index(4)?.name(), "CXMLField.pony")
    h.assert_eq[String](rdzip.zip_stat_index(5)?.name(), "CXMLFile.pony")
    h.assert_eq[String](rdzip.zip_stat_index(6)?.name(), "CXMLFunction.pony")
    h.assert_eq[String](rdzip.zip_stat_index(7)?.name(), "CXMLFunctionType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(8)?.name(), "CXMLFundamentalType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(9)?.name(), "CXMLPointerType.pony")
    h.assert_eq[String](rdzip.zip_stat_index(10)?.name(), "CXMLStruct.pony")
    h.assert_eq[String](rdzip.zip_stat_index(11)?.name(), "CXMLTypedef.pony")
    h.assert_eq[String](rdzip.zip_stat_index(12)?.name(), "CXMLUnimplemented.pony")
    h.assert_eq[String](rdzip.zip_stat_index(13)?.name(), "CXMLUnion.pony")
    h.assert_eq[String](rdzip.zip_stat_index(14)?.name(), "CXMLVariable.pony")
    h.assert_eq[I32](rdzip.close(), 0)

    h.env.out.print(rdzip.calc_crc32("0123456789".array()).string())
    /*
      env.out.print("There are " + zip.count()?.string() + " entries")
    end
    try
      let s: Array[Zipstat] = zip.filesdata()?
      for t in s.values() do
        env.out.print(t.name())
      end

      let zs: Zipstat = s.apply(14)?
      let data: String iso = String.from_iso_array(zip.readfile(zs)?)

      env.out.print(consume data)

    else
      env.out.print("BOOM")
    end
*/
