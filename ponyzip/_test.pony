
actor Main
  new create(env: Env) =>
    env.out.print("Starting")

    let filename: String = "test.zip"
    let zip: PonyZip = PonyZip(filename, [ZipRDOnly;ZipCheckcons])

    if (zip.valid()) then
      env.out.print("Successfully Opened " + filename)
    else
      env.out.print("Failed to open " + filename + ", Error: " + zip.errorstr + " (" + zip.errorno.string() + ")")
    end

    try
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

