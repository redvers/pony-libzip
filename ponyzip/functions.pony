use "lib:zip"
use "lib:z"

use @crc32[U32](crc32: U32, data: Pointer[U8] tag, length: I32)

primitive ABLibZIP
  """
  The documentation here will be incomplete.

  Please refer to the C API instructions which can be found
  at [https://libzip.org/documentation/](https://libzip.org/documentation/)
  """

  /* Open Archive */
  fun pzip_open(path: String, flags: U32, errorp: Pointer[I32] tag): NullablePointer[Zip] =>
"""
#### DESCRIPTION
The pzip_open() function opens the zip archive specified by path and returns
a pointer to a struct zip, used to manipulate the archive. The flags are
specified by or'ing the following values, or 0 for none of them.

* ZipCheckcons Perform additional stricter consistency checks on the
archive, and error if they fail.
* ZipCreate Create the archive if it does not exist.
* ZipExcl Error if archive already exists.
* ZipTruncate If archive exists, ignore its current contents. In other
words, handle it the same way as an empty archive.
* ZipRDOnly Open archive in read-only mode.

If an error occurs and errorp is non-NULL, it will be set to the
corresponding error code.

The pzip_open_from_source() function opens a zip archive encapsulated
by the zip_source zs using the provided flags. In case of error, the
ZipError ze is filled in.


#### RETURN VALUES
Upon successful completion pzip_open() and pzip_open_from_source()
return a struct zip pointer. Otherwise, NULL is returned and pzip_open()
sets *errorp to indicate the error, while zip_open_from(source)
sets ze to indicate the error.

#### ERRORS
The archive specified by path is opened unless:

* ZipERExists The file specified by path exists and ZIP_EXCL is set.
* ZipERIncons Inconsistencies were found in the file specified by
path. This error is often caused by specifying ZIP_CHECKCONS but can also happen without it.
* ZipERInval The path argument is NULL.
* ZipERMemory Required memory could not be allocated.
* ZipERNoent The file specified by path does not exist and ZIP_CREATE is not set.
* ZipERNozip The file specified by path is not a zip archive.
* ZipEROpen The file specified by path could not be opened.
* ZipERRead A read error occurred; see errno for details.
* ZipERSeek The file specified by path does not allow seeks.
"""
    @zip_open(path.cstring(), flags, errorp)

  fun pzip_fdopen(filedescriptor: I32, flags: I32, errorp: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_fdopen(filedescriptor, flags, errorp)

  fun pzip_open_from_source(zipsource: NullablePointer[Zipsource] tag, flags: U32, errorp: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_open_from_source(zipsource, flags, errorp)

  /* Find Files */
  fun pzip_name_locate(archive: NullablePointer[Zip] tag, filename: String, flags: U32): I64 =>
    @zip_name_locate(archive, filename.cstring(), flags)


  /* Read Files */
  fun pzip_stat(archive: NullablePointer[Zip] tag, filename: String, flags: U32, zipstat: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat(archive, filename.cstring(), flags, zipstat)

  fun pzip_stat_index(archive: NullablePointer[Zip] tag, index: U64, flags: U32, zipstat: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat_index(archive, index, flags, zipstat)

  fun pzip_stat_init(zipstat: NullablePointer[Zipstat] tag): None =>
    @zip_stat_init(zipstat)

  fun pzip_fopen(archive: NullablePointer[Zip] tag, filename: String, flags: U32): NullablePointer[Zipfile] =>
    @zip_fopen(archive, filename.cstring(), flags)

  fun pzip_fopen_encrypted(archive: NullablePointer[Zip] tag, filename: String, flags: U32, password: String): NullablePointer[Zipfile] =>
    @zip_fopen_encrypted(archive, filename.cstring(), flags, password.cstring())

  fun pzip_fopen_index(archive: NullablePointer[Zip] tag, index: U64, flags: U32): NullablePointer[Zipfile] =>
    @zip_fopen_index(archive, index, flags)

  fun pzip_fopen_index_encrypted(archive: NullablePointer[Zip] tag, index: U64, flags: U32, password: String): NullablePointer[Zipfile] =>
    @zip_fopen_index_encrypted(archive, index, flags, password.cstring())

  fun pzip_fread(file: NullablePointer[Zipfile] tag, buffer: Pointer[U8] tag, length: U64): I64 =>
    @zip_fread(file, buffer, length)

  fun pzip_fseek(file: NullablePointer[Zipfile] tag, offset: I64, whence: I32): I8 =>
    @zip_fseek(file, offset, whence)

  fun pzip_ftell(file: NullablePointer[Zipfile] tag): I64 =>
    @zip_ftell(file)

  fun pzip_fclose(file: NullablePointer[Zipfile] tag): I32 =>
    @zip_fclose(file)

  fun pzip_file_extra_fields_count(archive: NullablePointer[Zip] tag, index: U64, flags: U32): I16 =>
    @zip_file_extra_fields_count(archive, index, flags)

  fun pzip_file_extra_fields_count_by_id(archive: NullablePointer[Zip] tag, index: U64, extra_field_id: U16, flags: U32): I16 =>
    @zip_file_extra_fields_count_by_id(archive, index, extra_field_id, flags)

  fun pzip_file_extra_field_get(archive: NullablePointer[Zip] tag, index: U64, extra_field_index: U16, idp: Pointer[U16] tag, lenp: Pointer[U16] tag, flags: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get(archive, index, extra_field_index, idp, lenp, flags)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_extra_field_get_by_id(archive: NullablePointer[Zip] tag, index: U64, extra_field_id: U16, extra_field_index: U16, lenp: Pointer[U16] tag, flags: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get_by_id(archive, index, extra_field_id, extra_field_index, lenp, flags)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_get_comment(archive: NullablePointer[Zip] tag, index: U64, lenp: Pointer[U32] tag, flags: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_get_comment(archive, index, lenp, flags)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_get_external_attributes(archive: NullablePointer[Zip] tag, index: U64, flags: U32, opsys: String, attributes: Pointer[U32] tag): I32 =>
    @zip_file_get_external_attributes(archive, index, flags, opsys.cstring(), attributes) // String -> Aray[U8](1)

  fun pzip_get_archive_comment(archive: NullablePointer[Zip] tag, lenp: Pointer[I32] tag, flags: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_archive_comment(archive, lenp, flags)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_get_archive_flag(archive: NullablePointer[Zip] tag, flag: U32, flags: U32): I32 =>
    @zip_get_archive_flag(archive, flag, flags)

  fun pzip_get_name(archive: NullablePointer[Zip] tag, index: U64, flags: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_name(archive, index, flags)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_get_num_entries(archive: NullablePointer[Zip] tag, flags: U32): I64 =>
    @zip_get_num_entries(archive, flags)

  fun pzip_source_get_file_attributes(archive: NullablePointer[Zipsource] tag, attributes: NullablePointer[Zipfileattributes] tag): I32 =>
    @zip_source_get_file_attributes(archive, attributes)




  /* Close Archive */
  fun pzip_close(archive: NullablePointer[Zip] tag): I32 =>
    @zip_close(archive)

  fun pzip_discard(archive: NullablePointer[Zip] tag): None =>
    @zip_discard(archive)


  /* Creating / Modifying Archives */
  fun pzip_delete(archive: NullablePointer[Zip] tag, index: U64): I32 =>
    @zip_delete(archive, index)

  fun pzip_dir_add(archive: NullablePointer[Zip] tag, filename: String, flags: U32): I64 =>
    @zip_dir_add(archive, filename.cstring(), flags)

  fun pzip_file_add(archive: NullablePointer[Zip] tag, filename: String, zipsource: NullablePointer[Zipsource] tag, flags: U32): I64 =>
    @zip_file_add(archive, filename.cstring(), zipsource, flags)

  fun pzip_file_replace(archive: NullablePointer[Zip] tag, index: U64, zipsource: NullablePointer[Zipsource] tag, flags: U32): I32 =>
    @zip_file_replace(archive, index, zipsource, flags)

  fun pzip_file_attributes_init(attributes: NullablePointer[Zipfileattributes] tag): None =>
    @zip_file_attributes_init(attributes)

  fun pzip_file_extra_field_delete(archive: NullablePointer[Zip] tag, index: U64, extra_field_index: U16, flags: U32): I32 =>
    @zip_file_extra_field_delete(archive, index, extra_field_index, flags)

  fun pzip_file_extra_field_delete_by_id(archive: NullablePointer[Zip] tag, index: U64, extra_field_id: U16, extra_field_index: U16, flags: U32): I32 =>
    @zip_file_extra_field_delete_by_id(archive, index, extra_field_id, extra_field_index, flags)

  fun pzip_file_extra_field_set(archive: NullablePointer[Zip] tag, index: U64, extra_field_id: U16, extra_field_index: U16, extra_field_data: String, len: U16, flags: U32): I32 =>
    @zip_file_extra_field_set(archive, index, extra_field_id, extra_field_index, extra_field_data.cstring(), len, flags) // FIXME - not a string

  fun pzip_file_rename(archive: NullablePointer[Zip] tag, index: U64, filename: String, flags: U32): I32 =>
    @zip_file_rename(archive, index, filename.cstring(), flags)


  fun pzip_file_set_comment(archive: NullablePointer[Zip] tag, index: U64, comment: String, length: U16, flags: U32): I32 =>
    @zip_file_set_comment(archive, index, comment.cstring(), length, flags)

  fun pzip_file_set_dostime(archive: NullablePointer[Zip] tag, index: U64, dostime: U16, dosdate: U16, flags: U32): I32 =>
    @zip_file_set_dostime(archive, index, dostime, dosdate, flags)

  fun pzip_file_set_mtime(archive: NullablePointer[Zip] tag, index: U64, mtime: I64, flags: U32): I32 =>
    @zip_file_set_mtime(archive, index, mtime, flags)

  fun pzip_file_set_encryption(archive: NullablePointer[Zip] tag, index: U64, method: U16, password: String): I32 =>
    @zip_file_set_encryption(archive, index, method, password.cstring())

  fun pzip_file_set_external_attributes(archive: NullablePointer[Zip] tag, index: U64, flags: U32, opsys: U8, attributes: U32): I32 =>
    @zip_file_set_external_attributes(archive, index, flags, opsys, attributes)


  fun pzip_set_archive_comment(archive: NullablePointer[Zip] tag, comment: String, length: U16): I32 =>
    @zip_set_archive_comment(archive, comment.cstring(), length)

  fun pzip_set_archive_flag(archive: NullablePointer[Zip] tag, flags: U32, value: I32): I32 =>
    @zip_set_archive_flag(archive, flags, value)

  fun pzip_set_default_password(archive: NullablePointer[Zip] tag, password: String): I32 =>
    @zip_set_default_password(archive, password.cstring())

  fun pzip_set_file_compression(archive: NullablePointer[Zip] tag, index: U64, comp: I32, compflags: U32): I32 =>
    @zip_set_file_compression(archive, index, comp, compflags)

  fun pzip_source_begin_write(source: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_begin_write(source)

  fun pzip_source_begin_write_cloning(source: NullablePointer[Zipsource] tag, offset: U64): I32 =>
    @zip_source_begin_write_cloning(source, offset)

  fun pzip_source_buffer(archive: NullablePointer[Zip] tag, data: Pointer[U8] tag, length: U64, free: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer(archive, data, length, free)

  fun pzip_source_buffer_create(data: Pointer[U8] tag, length: U64, free: I32, errorp: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_create(data, length, free, errorp)

  fun pzip_source_buffer_fragment(archive: NullablePointer[Zip] tag, fragment: NullablePointer[Zipbufferfragment] tag, nfrags: U64, free: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment(archive, fragment, nfrags, free)

  fun pzip_source_buffer_fragment_create(fragment: NullablePointer[Zipbufferfragment] tag, nfrags: U64, free: I32, errorp: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment_create(fragment, nfrags, free, errorp)

  fun pzip_source_close(source: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_close(source)

  fun pzip_source_commit_write(source: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_commit_write(source)

  fun pzip_source_error(source: NullablePointer[Zipsource] tag): NullablePointer[Ziperror] =>
    @zip_source_error(source)

  fun pzip_source_file(zip: NullablePointer[Zip] tag, filename: String, start: U64, length: I64): NullablePointer[Zipsource] =>
    @zip_source_file(zip, filename.cstring(), start, length)

  fun pzip_source_file_create(filename: String, start: U64, length: I64, errorp: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_file_create(filename.cstring(), start, length, errorp)

  fun pzip_source_free(source: NullablePointer[Zipsource] tag): None =>
    @zip_source_free(source)

  fun pzip_source_keep(source: NullablePointer[Zipsource] tag): None =>
    @zip_source_keep(source)

  fun pzip_source_open(source: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_open(source)

  fun pzip_source_read(source: NullablePointer[Zipsource] tag, data: Pointer[U8] tag, length: U64): I64 =>
    @zip_source_read(source, data, length)

  fun pzip_source_rollback_write(source: NullablePointer[Zipsource] tag): None =>
    @zip_source_rollback_write(source)

  fun pzip_source_seek(source: NullablePointer[Zipsource] tag, offset: I64, whence: I32): I32 =>
    @zip_source_seek(source, offset, whence)

  fun pzip_source_seek_compute_offset(offset: U64, length: U64, data: Pointer[U8] tag, data_length: U64, errorp: NullablePointer[Ziperror] tag): I64 =>
    @zip_source_seek_compute_offset(offset, length, data, data_length, errorp)

  fun pzip_source_seek_write(source: NullablePointer[Zipsource] tag, offset: I64, whence: I32): I32 =>
    @zip_source_seek_write(source, offset, whence)

  fun pzip_source_stat(source: NullablePointer[Zipsource] tag, zipstat: NullablePointer[Zipstat] tag): I32 =>
    @zip_source_stat(source, zipstat)

  fun pzip_source_tell(source: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell(source)

  fun pzip_source_tell_write(source: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell_write(source)

  fun pzip_source_write(source: NullablePointer[Zipsource] tag, data: Pointer[U8] tag, length: U64): I64 =>
    @zip_source_write(source, data, length)

  fun pzip_source_zip(archive: NullablePointer[Zip] tag, sourcearchive: NullablePointer[Zip] tag, srcindex: U64, flags: U32, start: U64, length: I64): NullablePointer[Zipsource] =>
    @zip_source_zip(archive, sourcearchive, srcindex, flags, start, length)

  fun pzip_unchange(archive: NullablePointer[Zip] tag, index: U64): I32 =>
    @zip_unchange(archive, index)

  fun pzip_unchange_all(archive: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_all(archive)

  fun pzip_unchange_archive(archive: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_archive(archive)

  fun pzip_compression_method_supported(pmethod: I32, pcompress: I32): I32 =>
    @zip_compression_method_supported(pmethod, pcompress)

  fun pzip_encryption_method_supported(pmethod: U16, pencode: I32): I32 =>
    @zip_encryption_method_supported(pmethod, pencode)


  /* Error Handling */
  fun pzip_get_error(archive: NullablePointer[Zip] tag): NullablePointer[Ziperror] =>
    @zip_get_error(archive)

  fun pzip_error_clear(archive: NullablePointer[Zip] tag): None =>
    @zip_error_clear(archive)

  fun pzip_error_code_zip(perror: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_zip(perror)

  fun pzip_error_code_system(perror: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_system(perror)

  fun pzip_error_fini(perror: NullablePointer[Ziperror] tag): None =>
    @zip_error_fini(perror)

  fun pzip_error_init(perror: NullablePointer[Ziperror] tag): None =>
    @zip_error_init(perror)

  fun pzip_error_init_with_code(perror: NullablePointer[Ziperror] tag, errorno: I32): None =>
    @zip_error_init_with_code(perror, errorno)

  fun pzip_error_set(errorp: NullablePointer[Ziperror] tag, le: I32, se: I32): None =>
    @zip_error_set(errorp, le, se)

  fun pzip_error_strerror(errorp: NullablePointer[Ziperror] tag): String =>
    var pcstring: Pointer[U8] = @zip_error_strerror(errorp)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_error_system_type(errorp: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_system_type(errorp)

  fun pzip_error_to_data(errorp: NullablePointer[Ziperror] tag, data: Pointer[U8] tag, length: U64): I64 =>
    @zip_error_to_data(errorp, data, length)

  fun pzip_file_error_clear(file: NullablePointer[Zipfile] tag): None =>
    @zip_file_error_clear(file)

  fun pzip_file_get_error(file: NullablePointer[Zipfile] tag): NullablePointer[Ziperror] =>
    @zip_file_get_error(file)

  fun pzip_file_strerror(file: NullablePointer[Zipfile] tag): String =>
    var pcstring: Pointer[U8] = @zip_file_strerror(file)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_strerror(archive: NullablePointer[Zip] tag): String =>
    var pcstring: Pointer[U8] = @zip_strerror(archive)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  /* Misc */
  fun pzip_libzip_version(): String =>
    var pcstring: Pointer[U8] = @zip_libzip_version()
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_source_is_deleted(source: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_is_deleted(source)


  /* Obsolete Functions */

  fun obsolete_pzip_add(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: NullablePointer[Zipsource] tag): I64 =>
    @zip_add(pparg0, pparg1.cstring(), pparg2)


  fun obsolete_pzip_add_dir(pparg0: NullablePointer[Zip] tag, pparg1: String): I64 =>
    @zip_add_dir(pparg0, pparg1.cstring())

  fun obsolete_pzip_get_file_comment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[I32] tag, pparg3: I32): String =>
    var pcstring: Pointer[U8] = @zip_get_file_comment(pparg0, pparg1, pparg2, pparg3)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun obsolete_pzip_get_num_files(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_get_num_files(pparg0)


  fun obsolete_pzip_rename(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String): I32 =>
    @zip_rename(pparg0, pparg1, pparg2.cstring())


  fun obsolete_pzip_replace(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag): I32 =>
    @zip_replace(pparg0, pparg1, pparg2)


  fun obsolete_pzip_set_file_comment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: I32): I32 =>
    @zip_set_file_comment(pparg0, pparg1, pparg2.cstring(), pparg3)


  fun obsolete_pzip_error_get_sys_type(pparg0: I32): I32 =>
    @zip_error_get_sys_type(pparg0)


  fun obsolete_pzip_error_get(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag): None =>
    @zip_error_get(pparg0, pparg1, pparg2)


  fun obsolete_pzip_error_to_str(pparg0: String, pparg1: U64, pparg2: I32, pparg3: I32): I32 =>
    @zip_error_to_str(pparg0.cstring(), pparg1, pparg2, pparg3)


  fun obsolete_pzip_file_error_get(pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag): None =>
    @zip_file_error_get(pparg0, pparg1, pparg2)
