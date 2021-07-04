/* Manually written alas */

// Flags for zip_open
type ZipFlags is (ZipCreate|ZipExcl|ZipCheckcons|ZipTruncate|ZipRDOnly)
primitive ZipCreate    fun apply(): I32 => 1
primitive ZipExcl      fun apply(): I32 => 2
primitive ZipCheckcons fun apply(): I32 => 4
primitive ZipTruncate  fun apply(): I32 => 8
primitive ZipRDOnly    fun apply(): I32 => 16

/* flags for zip_name_locate, zip_fopen, zip_stat, ... */
type ZipFLFlags is (ZipFLNocase|ZipFLNodir|ZipFLCompressed|ZipFLUnchanged|ZipFLRecompress|ZipFLEncrypted|ZipFLEncGuess|ZipFLEncRaw|ZipFLEncStrict|ZipFLLocal|ZipFLCentral|ZipFLEncUtf8|ZipFLEncCp437|ZipFLOverwrite)
primitive ZipFLNocase fun apply(): U32 => 1       /* ignore case on name lookup */
primitive ZipFLNodir fun apply(): U32 => 2        /* ignore directory component */
primitive ZipFLCompressed fun apply(): U32 => 4   /* read compressed data */
primitive ZipFLUnchanged fun apply(): U32 => 8    /* use original data, ignoring changes */
primitive ZipFLRecompress fun apply(): U32 => 16  /* force recompression of data */
primitive ZipFLEncrypted fun apply(): U32 => 32   /* read encrypted data (implies ZipFLCOMPRESSED) */
primitive ZipFLEncGuess fun apply(): U32 => 0     /* guess string encoding (is default) */
primitive ZipFLEncRaw fun apply(): U32 => 64      /* get unmodified string */
primitive ZipFLEncStrict fun apply(): U32 => 128  /* follow specification strictly */
primitive ZipFLLocal fun apply(): U32 => 256      /* in local header */
primitive ZipFLCentral fun apply(): U32 => 512    /* in central directory */
/*                           1024u    reserved for internal use */
primitive ZipFLEncUtf8 fun apply(): U32 => 2048   /* string is UTF-8 encoded */
primitive ZipFLEncCp437 fun apply(): U32 => 4096  /* string is CP437 encoded */
primitive ZipFLOverwrite fun apply(): U32 => 8192 /* zip_file_add: if file with name exists, overwrite (replace) it */


/* archive global flags flags */
type ZipAflFlags is (ZipAFLRDOnly)
primitive ZipAFLRDOnly fun apply(): U32 => 2


/* libzip error codes */
type ZipER is (ZipEROK|ZipERMultidisk|ZipERRename|ZipERClose|ZipERSeek|ZipERRead|ZipERWrite|ZipERCRC|ZipERZipclosed|ZipERNoent|ZipERExists|ZipEROpen|ZipERTmpopen|ZipERZlib|ZipERMemory|ZipERChanged|ZipERCompnotsupp|ZipEREof|ZipERInval|ZipERNozip|ZipERInternal|ZipERIncons|ZipERRemove|ZipERDeleted|ZipEREncrnotsupp|ZipERRDOnly|ZipERNopasswd|ZipERWrongpasswd|ZipEROpnotsupp|ZipERInuse|ZipERTell|ZipERCompresseddata|ZipERCancelled)
primitive ZipEROK fun apply(): I32 => 0               /* N No error */
primitive ZipERMultidisk fun apply(): I32 => 1        /* N Multi-disk zip archives not supported */
primitive ZipERRename fun apply(): I32 => 2           /* S Renaming temporary file failed */
primitive ZipERClose fun apply(): I32 => 3            /* S Closing zip archive failed */
primitive ZipERSeek fun apply(): I32 => 4             /* S Seek error */
primitive ZipERRead fun apply(): I32 => 5             /* S Read error */
primitive ZipERWrite fun apply(): I32 => 6            /* S Write error */
primitive ZipERCRC fun apply(): I32 => 7              /* N CRC error */
primitive ZipERZipclosed fun apply(): I32 => 8        /* N Containing zip archive was closed */
primitive ZipERNoent fun apply(): I32 => 9            /* N No such file */
primitive ZipERExists fun apply(): I32 => 10          /* N File already exists */
primitive ZipEROpen fun apply(): I32 => 11            /* S Can't open file */
primitive ZipERTmpopen fun apply(): I32 => 12         /* S Failure to create temporary file */
primitive ZipERZlib fun apply(): I32 => 13            /* Z Zlib error */
primitive ZipERMemory fun apply(): I32 => 14          /* N Malloc failure */
primitive ZipERChanged fun apply(): I32 => 15         /* N Entry has been changed */
primitive ZipERCompnotsupp fun apply(): I32 => 16     /* N Compression method not supported */
primitive ZipEREof fun apply(): I32 => 17             /* N Premature end of file */
primitive ZipERInval fun apply(): I32 => 18           /* N Invalid argument */
primitive ZipERNozip fun apply(): I32 => 19           /* N Not a zip archive */
primitive ZipERInternal fun apply(): I32 => 20        /* N Internal error */
primitive ZipERIncons fun apply(): I32 => 21          /* N Zip archive inconsistent */
primitive ZipERRemove fun apply(): I32 => 22          /* S Can't remove file */
primitive ZipERDeleted fun apply(): I32 => 23         /* N Entry has been deleted */
primitive ZipEREncrnotsupp fun apply(): I32 => 24     /* N Encryption method not supported */
primitive ZipERRDOnly fun apply(): I32 => 25          /* N Read-only archive */
primitive ZipERNopasswd fun apply(): I32 => 26        /* N No password provided */
primitive ZipERWrongpasswd fun apply(): I32 => 27     /* N Wrong password provided */
primitive ZipEROpnotsupp fun apply(): I32 => 28       /* N Operation not supported */
primitive ZipERInuse fun apply(): I32 => 29           /* N Resource still in use */
primitive ZipERTell fun apply(): I32 => 30            /* S Tell error */
primitive ZipERCompresseddata fun apply(): I32 => 31  /* N Compressed data invalid */
primitive ZipERCancelled fun apply(): I32 => 32       /* N Operation cancelled */


/* type of system error value */
primitive ZipETNone fun apply(): I32 => 0 /* sys_err unused */
primitive ZipETSys fun apply(): I32 => 1  /* sys_err is errno */
primitive ZipETZlib fun apply(): I32 => 2 /* sys_err is zlib error code */

/* compression methods */
primitive ZipCMDefault fun apply(): I32 => -1 /* better of deflate or store */
primitive ZipCMStore fun apply(): I32 => 0    /* stored (uncompressed) */
primitive ZipCMShrink fun apply(): I32 => 1   /* shrunk */
primitive ZipCMReduce1 fun apply(): I32 => 2  /* reduced with factor 1 */
primitive ZipCMReduce2 fun apply(): I32 => 3  /* reduced with factor 2 */
primitive ZipCMReduce3 fun apply(): I32 => 4  /* reduced with factor 3 */
primitive ZipCMReduce4 fun apply(): I32 => 5  /* reduced with factor 4 */
primitive ZipCMImplode fun apply(): I32 => 6  /* imploded */
/* 7 - Reserved for Tokenizing compression algorithm */
primitive ZipCMDeflate fun apply(): I32 => 8         /* deflated */
primitive ZipCMDeflate64 fun apply(): I32 => 9       /* deflate64 */
primitive ZipCMPkwareimplode fun apply(): I32 => 10 /* PKWARE imploding */
/* 11 - Reserved by PKWARE */
primitive ZipCMBzip2 fun apply(): I32 => 12   /* compressed using BZIP2 algorithm */
/* 13 - Reserved by PKWARE */
primitive ZipCMLzma fun apply(): I32 => 14    /* LZMA (EFS) */
/* 15-17 - Reserved by PKWARE */
primitive ZipCMTerse fun apply(): I32 => 18   /* compressed using IBM TERSE (new) */
primitive ZipCMLz77 fun apply(): I32 => 19    /* IBM LZ77 z Architecture (PFS) */
primitive ZipCMLzma2 fun apply(): I32 => 33
primitive ZipCMxz fun apply(): I32 => 95      /* XZ compressed data */
primitive ZipCMJpeg fun apply(): I32 => 96    /* Compressed Jpeg data */
primitive ZipCMWavpack fun apply(): I32 => 97 /* WavPack compressed data */
primitive ZipCMPpmd fun apply(): I32 => 98    /* PPMd version I, Rev 1 */

/* encryption methods */

type ZipEMType is (ZipEMNone|ZipEMTradpkware|ZipEMDes|ZipEMRc2old|ZipEM3des168|ZipEM3des112|ZipEMPkzipaes128|ZipEMPkzipaes192|ZipEMPkzipaes256|ZipEMRc2|ZipEMRc4|ZipEMAes128|ZipEMAes192|ZipEMAes256|ZipEMUnknown)
primitive ZipEMNone fun apply(): U16 => 0         /* not encrypted */
primitive ZipEMTradpkware fun apply(): U16 => 1  /* traditional PKWARE encryption */
primitive ZipEMDes fun apply(): U16 => 0x6601     /* strong encryption: DES */
primitive ZipEMRc2old fun apply(): U16 => 0X6602 /* strong encryption: RC2, version < 5.2 */
primitive ZipEM3des168 fun apply(): U16 => 0x6603
primitive ZipEM3des112 fun apply(): U16 => 0X6609
primitive ZipEMPkzipaes128 fun apply(): U16 => 0X660e
primitive ZipEMPkzipaes192 fun apply(): U16 => 0x660f
primitive ZipEMPkzipaes256 fun apply(): U16 => 0x6610
primitive ZipEMRc2 fun apply(): U16 => 0x6702 /* strong encryption: RC2, version >= 5.2 */
primitive ZipEMRc4 fun apply(): U16 => 0x6801
primitive ZipEMAes128 fun apply(): U16 => 0X0101 /* Winzip AES encryption */
primitive ZipEMAes192 fun apply(): U16 => 0x0102
primitive ZipEMAes256 fun apply(): U16 => 0x0103
primitive ZipEMUnknown fun apply(): U16 => 0xffff /* unknown algorithm */


primitive ZipOPSYSDos fun apply(): U8 => 0x00
primitive ZipOPSYSAmiga fun apply(): U8 => 0x01
primitive ZipOPSYSOpenvms fun apply(): U8 => 0x02
primitive ZipOPSYSUnix fun apply(): U8 => 0x03
primitive ZipOPSYSVmcms fun apply(): U8 => 0x04
primitive ZipOPSYSAtarist fun apply(): U8 => 0x05
primitive ZipOPSYSOs2 fun apply(): U8 => 0x06
primitive ZipOPSYSMacintosh fun apply(): U8 => 0x07
primitive ZipOPSYSZsystem fun apply(): U8 => 0X08
primitive ZipOPSYSCpm fun apply(): U8 => 0x09
primitive ZipOPSYSWindowsntfs fun apply(): U8 => 0x0a
primitive ZipOPSYSMvs fun apply(): U8 => 0x0b
primitive ZipOPSYSVse fun apply(): U8 => 0x0c
primitive ZipOPSYSAcornrisc fun apply(): U8 => 0X0d
primitive ZipOPSYSVfat fun apply(): U8 => 0x0e
primitive ZipOPSYSAlternatemvs fun apply(): U8 => 0x0f
primitive ZipOPSYSBeos fun apply(): U8 => 0x10
primitive ZipOPSYSTandem fun apply(): U8 => 0X11
primitive ZipOPSYSOs400 fun apply(): U8 => 0x12
primitive ZipOPSYSOsx fun apply(): U8 => 0x13

type ZipOPSYSDefault is ZipOPSYSUnix


type ZipSOURCESupportsReadable is (ZipSOURCEOpen|ZipSOURCERead|ZipSOURCEClose|ZipSOURCEStat|ZipSOURCEError|ZipSOURCEFree)
primitive ZipSOURCEOpen fun apply(): U32 => 1 << 0               /* prepare for reading */
primitive ZipSOURCERead fun apply(): U32 => 1 << 1               /* read data */
primitive ZipSOURCEClose fun apply(): U32 => 1 << 2              /* reading is done */
primitive ZipSOURCEStat fun apply(): U32 => 1 << 3               /* get meta information */
primitive ZipSOURCEError fun apply(): U32 =>1 <<  4              /* get error information */
primitive ZipSOURCEFree fun apply(): U32 => 1 << 5               /* cleanup and free resources */


type ZipSOURCESupportsSeekable is (ZipSOURCESupportsReadable|ZipSOURCESeek|ZipSOURCETell|ZipSOURCESupports)
primitive ZipSOURCESeek fun apply(): U32 => 1 << 6               /* set position for reading */
primitive ZipSOURCETell fun apply(): U32 => 1 << 7               /* get read position */
primitive ZipSOURCESupports fun apply(): U32 => 1 << 14          /* check whether source supports command */

type ZipSOURCESupportsWritable is (ZipSOURCESupportsSeekable|ZipSOURCEBeginWrite|ZipSOURCECommitWrite|ZipSOURCERollbackWrite|ZipSOURCEWrite|ZipSOURCESeekWrite|ZipSOURCETellWrite|ZipSOURCERemove)
primitive ZipSOURCEBeginWrite fun apply(): U32 => 1 << 8         /* prepare for writing */
primitive ZipSOURCECommitWrite fun apply(): U32 => 1 << 9        /* writing is done */
primitive ZipSOURCERollbackWrite fun apply(): U32 => 1 << 10      /* discard written changes */
primitive ZipSOURCEWrite fun apply(): U32 => 1 << 11             /* write data */
primitive ZipSOURCESeekWrite fun apply(): U32 => 1 << 12         /* set position for writing */
primitive ZipSOURCETellWrite fun apply(): U32 => 1 << 13         /* get write position */
primitive ZipSOURCERemove fun apply(): U32 => 1 << 15            /* remove file */



primitive ZipSOURCEReserved1 fun apply(): U32 => 1 << 16         /* previously used internally */
primitive ZipSOURCEBeginWriteCloning fun apply(): U32 => 1 << 17 /* like ZIP_SOURCE_BEGIN_WRITE, but keep part of original file */
primitive ZipSOURCEAcceptEmpty fun apply(): U32 => 1 << 18       /* whether empty files are valid archives */
primitive ZipSOURCEGetFileAttributes fun apply(): U32 => 1 << 19 /* get additional file attributes */



type ZipStatFlags is (ZipSTATName|ZipSTATIndex|ZipSTATSize|ZipSTATCompSize|ZipSTATMtime|ZipSTATCrc|ZipSTATCompMethod|ZipSTATEncryptionMethod|ZipSTATFlag)
primitive ZipSTATName fun apply(): U16 => 0x0001
primitive ZipSTATIndex fun apply(): U16 => 0x0002
primitive ZipSTATSize fun apply(): U16 => 0x0004
primitive ZipSTATCompSize fun apply(): U16 => 0x0008
primitive ZipSTATMtime fun apply(): U16 => 0x0010
primitive ZipSTATCrc fun apply(): U16 => 0x0020
primitive ZipSTATCompMethod fun apply(): U16 => 0x0040
primitive ZipSTATEncryptionMethod fun apply(): U16 => 0x0080
primitive ZipSTATFlag fun apply(): U16 => 0x0100



type ZipFileAttributesFlags is (ZipFileAttributesHostSystem|ZipFileAttributesAscii|ZipFileAttributesVersionNeeded|ZipFileAttributesExternalFileAttributes|ZipFileAttributesGeneralPurposeBitFlags)
primitive ZipFileAttributesHostSystem             fun apply(): U16 => 0x0001
primitive ZipFileAttributesAscii                  fun apply(): U16 => 0x0002
primitive ZipFileAttributesVersionNeeded          fun apply(): U16 => 0x0004
primitive ZipFileAttributesExternalFileAttributes fun apply(): U16 => 0x0008
primitive ZipFileAttributesGeneralPurposeBitFlags fun apply(): U16 => 0x0010






