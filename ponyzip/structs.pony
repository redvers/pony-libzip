use "time"

struct Zipsourceargsseek
  var poffset: I64 = I64(0)
  var pwhence: I32 = I32(0)

struct Ziperror
  var pziperr: I32 = I32(0)
  var psyserr: I32 = I32(0)
  var pstr: Pointer[U8] = Pointer[U8]

struct Zipstat
  var pvalid: U64 = U64(0)
  var pname: Pointer[U8] = Pointer[U8]
  var pindex: U64 = U64(0)
  var psize: U64 = U64(0)
  var pcompsize: U64 = U64(0)
  var pmtime: I64 = I64(0)
  var pcrc: U32 = U32(0)
  var pcompmethod: U16 = U16(0)
  var pencryptionmethod: U16 = U16(0)
  var pflags: U32 = U32(0)

  fun ref name(): String iso^ =>
    let s: String iso = String.from_cstring(pname).clone()
    consume s

  fun index(): USize =>
    pindex.usize()

  fun size(): USize =>
    psize.usize()

  fun compsize(): USize =>
    pcompsize.usize()

  fun mtime(): PosixDate =>
    PosixDate(pmtime, I64(0))

  fun crc(): U32 =>
    pcrc


struct Zipbufferfragment
  var pdata: Pointer[U8] = Pointer[U8]
  var plength: U64 = U64(0)

struct Zipfileattributes
  var pvalid: U64 = U64(0)
  var pversion: U8 = U8(0)
  var phostsystem: U8 = U8(0)
  var pascii: U8 = U8(0)
  var pversionneeded: U8 = U8(0)
  var pexternalfileattributes: U32 = U32(0)
  var pgeneralpurposebitflags: U16 = U16(0)
  var pgeneralpurposebitmask: U16 = U16(0)

struct Zip


struct Zipfile


struct Zipsource

struct IOFILE
