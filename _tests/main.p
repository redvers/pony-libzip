
actor Main
  new create(env: Env) =>
    env.out.print("Starting")

    let filename: String = "test.zip"
    let zip: PonyZip = PonyZip.openRO(filename)

    if (zip.valid) then
      env.out.print("Successfully Opened " + filename)
    else
      env.out.print("Failed to open " + filename + ", Error: " + zip.errorstr + " (" + zip.errorno.string() + ")")
    end

    try
      env.out.print("There are " + zip.count()?.string() + " entries")
    end
