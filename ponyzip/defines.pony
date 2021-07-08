use "collections"
/* Manually written alas */

// Flags for zip_open
type ZipFlags is Flags[(ZipCreate|ZipExcl|ZipCheckcons|ZipTruncate|ZipRDOnly), U32]
primitive ZipCreate    fun value(): U32 => 1
primitive ZipExcl      fun value(): U32 => 2
primitive ZipCheckcons fun value(): U32 => 4
primitive ZipTruncate  fun value(): U32 => 8
primitive ZipRDOnly    fun value(): U32 => 16

/* flags for zip_name_locate, zip_fopen, zip_stat, ... */
type ZipFLFlags is Flags[(ZipFLNocase|ZipFLNodir|ZipFLCompressed|ZipFLUnchanged|ZipFLRecompress|ZipFLEncrypted|ZipFLEncGuess|ZipFLEncRaw|ZipFLEncStrict|ZipFLLocal|ZipFLCentral|ZipFLEncUtf8|ZipFLEncCp437|ZipFLOverwrite), U32]
primitive ZipFLNocase fun value(): U32 => 1       /* ignore case on name lookup */
primitive ZipFLNodir fun value(): U32 => 2        /* ignore directory component */
primitive ZipFLCompressed fun value(): U32 => 4   /* read compressed data */
primitive ZipFLUnchanged fun value(): U32 => 8    /* use original data, ignoring changes */
primitive ZipFLRecompress fun value(): U32 => 16  /* force recompression of data */
primitive ZipFLEncrypted fun value(): U32 => 32   /* read encrypted data (implies ZipFLCOMPRESSED) */
primitive ZipFLEncGuess fun value(): U32 => 0     /* guess string encoding (is default) */
primitive ZipFLEncRaw fun value(): U32 => 64      /* get unmodified string */
primitive ZipFLEncStrict fun value(): U32 => 128  /* follow specification strictly */
primitive ZipFLLocal fun value(): U32 => 256      /* in local header */
primitive ZipFLCentral fun value(): U32 => 512    /* in central directory */
/*                           1024u    reserved for internal use */
primitive ZipFLEncUtf8 fun value(): U32 => 2048   /* string is UTF-8 encoded */
primitive ZipFLEncCp437 fun value(): U32 => 4096  /* string is CP437 encoded */
primitive ZipFLOverwrite fun value(): U32 => 8192 /* zip_file_add: if file with name exists, overwrite (replace) it */


/* archive global flags flags */
type ZipAflFlags is Flags[(ZipAFLRDOnly), U32]
primitive ZipAFLRDOnly fun value(): U32 => 2


/* libzip error codes */
type ZipER is (ZipEROK|ZipERMultidisk|ZipERRename|ZipERClose|ZipERSeek|ZipERRead|ZipERWrite|ZipERCRC|ZipERZipclosed|ZipERNoent|ZipERExists|ZipEROpen|ZipERTmpopen|ZipERZlib|ZipERMemory|ZipERChanged|ZipERCompnotsupp|ZipEREof|ZipERInval|ZipERNozip|ZipERInternal|ZipERIncons|ZipERRemove|ZipERDeleted|ZipEREncrnotsupp|ZipERRDOnly|ZipERNopasswd|ZipERWrongpasswd|ZipEROpnotsupp|ZipERInuse|ZipERTell|ZipERCompresseddata|ZipERCancelled)
primitive ZipERR
  fun decode(value: I32): ZipER =>
    match value
    | let x: I32 if (x ==  0) => ZipEROK
    | let x: I32 if (x ==  1) => ZipERMultidisk
    | let x: I32 if (x ==  2) => ZipERRename
    | let x: I32 if (x ==  3) => ZipERClose
    | let x: I32 if (x ==  4) => ZipERSeek
    | let x: I32 if (x ==  5) => ZipERRead
    | let x: I32 if (x ==  6) => ZipERWrite
    | let x: I32 if (x ==  7) => ZipERCRC
    | let x: I32 if (x ==  8) => ZipERZipclosed
    | let x: I32 if (x ==  9) => ZipERNoent
    | let x: I32 if (x == 10) => ZipERExists
    | let x: I32 if (x == 11) => ZipEROpen
    | let x: I32 if (x == 12) => ZipERTmpopen
    | let x: I32 if (x == 13) => ZipERZlib
    | let x: I32 if (x == 14) => ZipERMemory
    | let x: I32 if (x == 15) => ZipERChanged
    | let x: I32 if (x == 16) => ZipERCompnotsupp
    | let x: I32 if (x == 17) => ZipEREof
    | let x: I32 if (x == 18) => ZipERInval
    | let x: I32 if (x == 19) => ZipERNozip
    | let x: I32 if (x == 20) => ZipERInternal
    | let x: I32 if (x == 21) => ZipERIncons
    | let x: I32 if (x == 22) => ZipERRemove
    | let x: I32 if (x == 23) => ZipERDeleted
    | let x: I32 if (x == 24) => ZipEREncrnotsupp
    | let x: I32 if (x == 25) => ZipERRDOnly
    | let x: I32 if (x == 26) => ZipERNopasswd
    | let x: I32 if (x == 27) => ZipERWrongpasswd
    | let x: I32 if (x == 28) => ZipEROpnotsupp
    | let x: I32 if (x == 29) => ZipERInuse
    | let x: I32 if (x == 30) => ZipERTell
    | let x: I32 if (x == 31) => ZipERCompresseddata
    | let x: I32 if (x == 32) => ZipERCancelled
    else
      ZipEROK
    end

primitive ZipEROK fun value(): I32 => 0               /* N No error */
primitive ZipERMultidisk fun value(): I32 => 1        /* N Multi-disk zip archives not supported */
primitive ZipERRename fun value(): I32 => 2           /* S Renaming temporary file failed */
primitive ZipERClose fun value(): I32 => 3            /* S Closing zip archive failed */
primitive ZipERSeek fun value(): I32 => 4             /* S Seek error */
primitive ZipERRead fun value(): I32 => 5             /* S Read error */
primitive ZipERWrite fun value(): I32 => 6            /* S Write error */
primitive ZipERCRC fun value(): I32 => 7              /* N CRC error */
primitive ZipERZipclosed fun value(): I32 => 8        /* N Containing zip archive was closed */
primitive ZipERNoent fun value(): I32 => 9            /* N No such file */
primitive ZipERExists fun value(): I32 => 10          /* N File already exists */
primitive ZipEROpen fun value(): I32 => 11            /* S Can't open file */
primitive ZipERTmpopen fun value(): I32 => 12         /* S Failure to create temporary file */
primitive ZipERZlib fun value(): I32 => 13            /* Z Zlib error */
primitive ZipERMemory fun value(): I32 => 14          /* N Malloc failure */
primitive ZipERChanged fun value(): I32 => 15         /* N Entry has been changed */
primitive ZipERCompnotsupp fun value(): I32 => 16     /* N Compression method not supported */
primitive ZipEREof fun value(): I32 => 17             /* N Premature end of file */
primitive ZipERInval fun value(): I32 => 18           /* N Invalid argument */
primitive ZipERNozip fun value(): I32 => 19           /* N Not a zip archive */
primitive ZipERInternal fun value(): I32 => 20        /* N Internal error */
primitive ZipERIncons fun value(): I32 => 21          /* N Zip archive inconsistent */
primitive ZipERRemove fun value(): I32 => 22          /* S Can't remove file */
primitive ZipERDeleted fun value(): I32 => 23         /* N Entry has been deleted */
primitive ZipEREncrnotsupp fun value(): I32 => 24     /* N Encryption method not supported */
primitive ZipERRDOnly fun value(): I32 => 25          /* N Read-only archive */
primitive ZipERNopasswd fun value(): I32 => 26        /* N No password provided */
primitive ZipERWrongpasswd fun value(): I32 => 27     /* N Wrong password provided */
primitive ZipEROpnotsupp fun value(): I32 => 28       /* N Operation not supported */
primitive ZipERInuse fun value(): I32 => 29           /* N Resource still in use */
primitive ZipERTell fun value(): I32 => 30            /* S Tell error */
primitive ZipERCompresseddata fun value(): I32 => 31  /* N Compressed data invalid */
primitive ZipERCancelled fun value(): I32 => 32       /* N Operation cancelled */


/* type of system error value */
primitive ZipETNone fun value(): I32 => 0 /* sys_err unused */
primitive ZipETSys fun value(): I32 => 1  /* sys_err is errno */
primitive ZipETZlib fun value(): I32 => 2 /* sys_err is zlib error code */

/* compression methods */
primitive ZipCMDefault fun value(): I32 => -1 /* better of deflate or store */
primitive ZipCMStore fun value(): I32 => 0    /* stored (uncompressed) */
primitive ZipCMShrink fun value(): I32 => 1   /* shrunk */
primitive ZipCMReduce1 fun value(): I32 => 2  /* reduced with factor 1 */
primitive ZipCMReduce2 fun value(): I32 => 3  /* reduced with factor 2 */
primitive ZipCMReduce3 fun value(): I32 => 4  /* reduced with factor 3 */
primitive ZipCMReduce4 fun value(): I32 => 5  /* reduced with factor 4 */
primitive ZipCMImplode fun value(): I32 => 6  /* imploded */
/* 7 - Reserved for Tokenizing compression algorithm */
primitive ZipCMDeflate fun value(): I32 => 8         /* deflated */
primitive ZipCMDeflate64 fun value(): I32 => 9       /* deflate64 */
primitive ZipCMPkwareimplode fun value(): I32 => 10 /* PKWARE imploding */
/* 11 - Reserved by PKWARE */
primitive ZipCMBzip2 fun value(): I32 => 12   /* compressed using BZIP2 algorithm */
/* 13 - Reserved by PKWARE */
primitive ZipCMLzma fun value(): I32 => 14    /* LZMA (EFS) */
/* 15-17 - Reserved by PKWARE */
primitive ZipCMTerse fun value(): I32 => 18   /* compressed using IBM TERSE (new) */
primitive ZipCMLz77 fun value(): I32 => 19    /* IBM LZ77 z Architecture (PFS) */
primitive ZipCMLzma2 fun value(): I32 => 33
primitive ZipCMxz fun value(): I32 => 95      /* XZ compressed data */
primitive ZipCMJpeg fun value(): I32 => 96    /* Compressed Jpeg data */
primitive ZipCMWavpack fun value(): I32 => 97 /* WavPack compressed data */
primitive ZipCMPpmd fun value(): I32 => 98    /* PPMd version I, Rev 1 */

/* encryption methods */

type ZipEMType is (ZipEMNone|ZipEMTradpkware|ZipEMDes|ZipEMRc2old|ZipEM3des168|ZipEM3des112|ZipEMPkzipaes128|ZipEMPkzipaes192|ZipEMPkzipaes256|ZipEMRc2|ZipEMRc4|ZipEMAes128|ZipEMAes192|ZipEMAes256|ZipEMUnknown)
primitive ZipEMNone fun value(): U16 => 0         /* not encrypted */
primitive ZipEMTradpkware fun value(): U16 => 1  /* traditional PKWARE encryption */
primitive ZipEMDes fun value(): U16 => 0x6601     /* strong encryption: DES */
primitive ZipEMRc2old fun value(): U16 => 0X6602 /* strong encryption: RC2, version < 5.2 */
primitive ZipEM3des168 fun value(): U16 => 0x6603
primitive ZipEM3des112 fun value(): U16 => 0X6609
primitive ZipEMPkzipaes128 fun value(): U16 => 0X660e
primitive ZipEMPkzipaes192 fun value(): U16 => 0x660f
primitive ZipEMPkzipaes256 fun value(): U16 => 0x6610
primitive ZipEMRc2 fun value(): U16 => 0x6702 /* strong encryption: RC2, version >= 5.2 */
primitive ZipEMRc4 fun value(): U16 => 0x6801
primitive ZipEMAes128 fun value(): U16 => 0X0101 /* Winzip AES encryption */
primitive ZipEMAes192 fun value(): U16 => 0x0102
primitive ZipEMAes256 fun value(): U16 => 0x0103
primitive ZipEMUnknown fun value(): U16 => 0xffff /* unknown algorithm */

/* System Type */
primitive ZipOPSYSDos fun value(): U8 => 0x00
primitive ZipOPSYSAmiga fun value(): U8 => 0x01
primitive ZipOPSYSOpenvms fun value(): U8 => 0x02
primitive ZipOPSYSUnix fun value(): U8 => 0x03
primitive ZipOPSYSVmcms fun value(): U8 => 0x04
primitive ZipOPSYSAtarist fun value(): U8 => 0x05
primitive ZipOPSYSOs2 fun value(): U8 => 0x06
primitive ZipOPSYSMacintosh fun value(): U8 => 0x07
primitive ZipOPSYSZsystem fun value(): U8 => 0X08
primitive ZipOPSYSCpm fun value(): U8 => 0x09
primitive ZipOPSYSWindowsntfs fun value(): U8 => 0x0a
primitive ZipOPSYSMvs fun value(): U8 => 0x0b
primitive ZipOPSYSVse fun value(): U8 => 0x0c
primitive ZipOPSYSAcornrisc fun value(): U8 => 0X0d
primitive ZipOPSYSVfat fun value(): U8 => 0x0e
primitive ZipOPSYSAlternatemvs fun value(): U8 => 0x0f
primitive ZipOPSYSBeos fun value(): U8 => 0x10
primitive ZipOPSYSTandem fun value(): U8 => 0X11
primitive ZipOPSYSOs400 fun value(): U8 => 0x12
primitive ZipOPSYSOsx fun value(): U8 => 0x13

type ZipOPSYSDefault is ZipOPSYSUnix


type ZipSOURCESupportsReadable is (ZipSOURCEOpen|ZipSOURCERead|ZipSOURCEClose|ZipSOURCEStat|ZipSOURCEError|ZipSOURCEFree)
type ZipSOURCESupportsReadableFlags is Flags[(ZipSOURCESupportsReadable), U32]
primitive ZipSOURCEOpen fun value(): U32 => 1 << 0               /* prepare for reading */
primitive ZipSOURCERead fun value(): U32 => 1 << 1               /* read data */
primitive ZipSOURCEClose fun value(): U32 => 1 << 2              /* reading is done */
primitive ZipSOURCEStat fun value(): U32 => 1 << 3               /* get meta information */
primitive ZipSOURCEError fun value(): U32 =>1 <<  4              /* get error information */
primitive ZipSOURCEFree fun value(): U32 => 1 << 5               /* cleanup and free resources */


type ZipSOURCESupportsSeekable is (ZipSOURCESupportsReadable|ZipSOURCESeek|ZipSOURCETell|ZipSOURCESupports)
type ZipSOURCESupportsSeekableFlags is Flags[(ZipSOURCESupportsSeekable|ZipSOURCESupportsReadable), U32]
primitive ZipSOURCESeek fun value(): U32 => 1 << 6               /* set position for reading */
primitive ZipSOURCETell fun value(): U32 => 1 << 7               /* get read position */
primitive ZipSOURCESupports fun value(): U32 => 1 << 14          /* check whether source supports command */

type ZipSOURCESupportsWritable is (ZipSOURCESupportsSeekable|ZipSOURCEBeginWrite|ZipSOURCECommitWrite|ZipSOURCERollbackWrite|ZipSOURCEWrite|ZipSOURCESeekWrite|ZipSOURCETellWrite|ZipSOURCERemove)
type ZipSOURCESupportsWritableFlags is Flags[(ZipSOURCESupportsWritable|ZipSOURCESupportsSeekable), U32]
primitive ZipSOURCEBeginWrite fun value(): U32 => 1 << 8         /* prepare for writing */
primitive ZipSOURCECommitWrite fun value(): U32 => 1 << 9        /* writing is done */
primitive ZipSOURCERollbackWrite fun value(): U32 => 1 << 10      /* discard written changes */
primitive ZipSOURCEWrite fun value(): U32 => 1 << 11             /* write data */
primitive ZipSOURCESeekWrite fun value(): U32 => 1 << 12         /* set position for writing */
primitive ZipSOURCETellWrite fun value(): U32 => 1 << 13         /* get write position */
primitive ZipSOURCERemove fun value(): U32 => 1 << 15            /* remove file */

// FIXME  - These should be defined in the flags somehow.
// What am I missing?
primitive ZipSOURCEReserved1 fun value(): U32 => 1 << 16         /* previously used internally */
primitive ZipSOURCEBeginWriteCloning fun value(): U32 => 1 << 17 /* like ZIP_SOURCE_BEGIN_WRITE, but keep part of original file */
primitive ZipSOURCEAcceptEmpty fun value(): U32 => 1 << 18       /* whether empty files are valid archives */
primitive ZipSOURCEGetFileAttributes fun value(): U32 => 1 << 19 /* get additional file attributes */



type ZipStatFlags is Flags[(ZipSTATName|ZipSTATIndex|ZipSTATSize|ZipSTATCompSize|ZipSTATMtime|ZipSTATCrc|ZipSTATCompMethod|ZipSTATEncryptionMethod|ZipSTATFlag), U16]
primitive ZipSTATName fun value(): U16 => 0x0001
primitive ZipSTATIndex fun value(): U16 => 0x0002
primitive ZipSTATSize fun value(): U16 => 0x0004
primitive ZipSTATCompSize fun value(): U16 => 0x0008
primitive ZipSTATMtime fun value(): U16 => 0x0010
primitive ZipSTATCrc fun value(): U16 => 0x0020
primitive ZipSTATCompMethod fun value(): U16 => 0x0040
primitive ZipSTATEncryptionMethod fun value(): U16 => 0x0080
primitive ZipSTATFlag fun value(): U16 => 0x0100



type ZipFileAttributesFlags is Flags[(ZipFileAttributesHostSystem|ZipFileAttributesAscii|ZipFileAttributesVersionNeeded|ZipFileAttributesExternalFileAttributes|ZipFileAttributesGeneralPurposeBitFlags), U16]
primitive ZipFileAttributesHostSystem             fun value(): U16 => 0x0001
primitive ZipFileAttributesAscii                  fun value(): U16 => 0x0002
primitive ZipFileAttributesVersionNeeded          fun value(): U16 => 0x0004
primitive ZipFileAttributesExternalFileAttributes fun value(): U16 => 0x0008
primitive ZipFileAttributesGeneralPurposeBitFlags fun value(): U16 => 0x0010






