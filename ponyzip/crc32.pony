primitive CRC32
  fun calc(data: Array[U8] val): U32 =>
  """
  Returns the CRC32 of a blob of data
  """
    @crc32(0, data.cpointer(), data.size().i32())
