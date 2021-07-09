use "lib:zip"
use "lib:z"

use @crc32[U32](crc32: U32, data: Pointer[U8] tag, length: I32)

primitive ABLibZIP
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

  fun pzip_fdopen(pparg0: I32, pparg1: I32, pparg2: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_fdopen(pparg0, pparg1, pparg2)

  fun pzip_open_from_source(pparg0: NullablePointer[Zipsource] tag, pparg1: U32, pparg2: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_open_from_source(pparg0, pparg1, pparg2)

  /* Find Files */
  fun pzip_name_locate(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): I64 =>
    @zip_name_locate(pparg0, pparg1.cstring(), pparg2)


  /* Read Files */
  fun pzip_stat(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32, pparg3: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat(pparg0, pparg1.cstring(), pparg2, pparg3)

  fun pzip_stat_index(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat_index(pparg0, pparg1, pparg2, pparg3)

  fun pzip_stat_init(pparg0: NullablePointer[Zipstat] tag): None =>
    @zip_stat_init(pparg0)

  fun pzip_fopen(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): NullablePointer[Zipfile] =>
    @zip_fopen(pparg0, pparg1.cstring(), pparg2)

  fun pzip_fopen_encrypted(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32, pparg3: String): NullablePointer[Zipfile] =>
    @zip_fopen_encrypted(pparg0, pparg1.cstring(), pparg2, pparg3.cstring())

  fun pzip_fopen_index(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): NullablePointer[Zipfile] =>
    @zip_fopen_index(pparg0, pparg1, pparg2)

  fun pzip_fopen_index_encrypted(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: String): NullablePointer[Zipfile] =>
    @zip_fopen_index_encrypted(pparg0, pparg1, pparg2, pparg3.cstring())

  fun pzip_fread(pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[U8] tag, pparg2: U64): I64 =>
    @zip_fread(pparg0, pparg1, pparg2)

  fun pzip_fseek(pparg0: NullablePointer[Zipfile] tag, pparg1: I64, pparg2: I32): I8 =>
    @zip_fseek(pparg0, pparg1, pparg2)

  fun pzip_ftell(pparg0: NullablePointer[Zipfile] tag): I64 =>
    @zip_ftell(pparg0)

  fun pzip_fclose(pparg0: NullablePointer[Zipfile] tag): I32 =>
    @zip_fclose(pparg0)

  fun pzip_file_extra_fields_count(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): I16 =>
    @zip_file_extra_fields_count(pparg0, pparg1, pparg2)

  fun pzip_file_extra_fields_count_by_id(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32): I16 =>
    @zip_file_extra_fields_count_by_id(pparg0, pparg1, pparg2, pparg3)

  fun pzip_file_extra_field_get(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: Pointer[U16] tag, pparg4: Pointer[U16] tag, pparg5: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_extra_field_get_by_id(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: Pointer[U16] tag, pparg5: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get_by_id(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_get_comment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U32] tag, pparg3: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_get_comment(pparg0, pparg1, pparg2, pparg3)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_file_get_external_attributes(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: String, pparg4: Pointer[U32] tag): I32 =>
    @zip_file_get_external_attributes(pparg0, pparg1, pparg2, pparg3.cstring(), pparg4)

  fun pzip_get_archive_comment(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_archive_comment(pparg0, pparg1, pparg2)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_get_archive_flag(pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: U32): I32 =>
    @zip_get_archive_flag(pparg0, pparg1, pparg2)

  fun pzip_get_name(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_name(pparg0, pparg1, pparg2)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_get_num_entries(pparg0: NullablePointer[Zip] tag, pparg1: U32): I64 =>
    @zip_get_num_entries(pparg0, pparg1)

  fun pzip_source_get_file_attributes(pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipfileattributes] tag): I32 =>
    @zip_source_get_file_attributes(pparg0, pparg1)




  /* Close Archive */
  fun pzip_close(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_close(pparg0)

  fun pzip_discard(pparg0: NullablePointer[Zip] tag): None =>
    @zip_discard(pparg0)


  /* Creating / Modifying Archives */
  fun pzip_delete(pparg0: NullablePointer[Zip] tag, pparg1: U64): I32 =>
    @zip_delete(pparg0, pparg1)

  fun pzip_dir_add(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): I64 =>
    @zip_dir_add(pparg0, pparg1.cstring(), pparg2)

  fun pzip_file_add(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: NullablePointer[Zipsource] tag, pparg3: U32): I64 =>
    @zip_file_add(pparg0, pparg1.cstring(), pparg2, pparg3)

  fun pzip_file_attributes_init(pparg0: NullablePointer[Zipfileattributes] tag): None =>
    @zip_file_attributes_init(pparg0)

  fun pzip_file_extra_field_delete(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32): I32 =>
    @zip_file_extra_field_delete(pparg0, pparg1, pparg2, pparg3)

  fun pzip_file_extra_field_delete_by_id(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_extra_field_delete_by_id(pparg0, pparg1, pparg2, pparg3, pparg4)

  fun pzip_file_extra_field_set(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: String, pparg5: U16, pparg6: U32): I32 =>
    @zip_file_extra_field_set(pparg0, pparg1, pparg2, pparg3, pparg4.cstring(), pparg5, pparg6)

  fun pzip_file_rename(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: U32): I32 =>
    @zip_file_rename(pparg0, pparg1, pparg2.cstring(), pparg3)

  fun pzip_file_replace(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag, pparg3: U32): I32 =>
    @zip_file_replace(pparg0, pparg1, pparg2, pparg3)

  fun pzip_file_set_comment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_set_comment(pparg0, pparg1, pparg2.cstring(), pparg3, pparg4)

  fun pzip_file_set_dostime(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_set_dostime(pparg0, pparg1, pparg2, pparg3, pparg4)

  fun pzip_file_set_encryption(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: String): I32 =>
    @zip_file_set_encryption(pparg0, pparg1, pparg2, pparg3.cstring())

  fun pzip_file_set_external_attributes(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: U8, pparg4: U32): I32 =>
    @zip_file_set_external_attributes(pparg0, pparg1, pparg2, pparg3, pparg4)

  fun pzip_file_set_mtime(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I64, pparg3: U32): I32 =>
    @zip_file_set_mtime(pparg0, pparg1, pparg2, pparg3)

  fun pzip_set_archive_comment(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U16): I32 =>
    @zip_set_archive_comment(pparg0, pparg1.cstring(), pparg2)

  fun pzip_set_archive_flag(pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: I32): I32 =>
    @zip_set_archive_flag(pparg0, pparg1, pparg2)

  fun pzip_set_default_password(pparg0: NullablePointer[Zip] tag, pparg1: String): I32 =>
    @zip_set_default_password(pparg0, pparg1.cstring())

  fun pzip_set_file_compression(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I32, pparg3: U32): I32 =>
    @zip_set_file_compression(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_begin_write(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_begin_write(pparg0)

  fun pzip_source_begin_write_cloning(pparg0: NullablePointer[Zipsource] tag, pparg1: U64): I32 =>
    @zip_source_begin_write_cloning(pparg0, pparg1)

  fun pzip_source_buffer(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U64, pparg3: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_buffer_create(pparg0: Pointer[U8] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_create(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_buffer_fragment(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zipbufferfragment] tag, pparg2: U64, pparg3: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_buffer_fragment_create(pparg0: NullablePointer[Zipbufferfragment] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment_create(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_close(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_close(pparg0)

  fun pzip_source_commit_write(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_commit_write(pparg0)

  fun pzip_source_error(pparg0: NullablePointer[Zipsource] tag): NullablePointer[Ziperror] =>
    @zip_source_error(pparg0)

  fun pzip_source_file(zip: NullablePointer[Zip] tag, filename: String, start: U64, length: I64): NullablePointer[Zipsource] =>
    @zip_source_file(zip, filename.cstring(), start, length)

  fun pzip_source_file_create(pparg0: String, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_file_create(pparg0.cstring(), pparg1, pparg2, pparg3)

  fun pzip_source_filep(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[IOFILE] tag, pparg2: U64, pparg3: I64): NullablePointer[Zipsource] =>
    @zip_source_filep(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_filep_create(pparg0: NullablePointer[IOFILE] tag, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_filep_create(pparg0, pparg1, pparg2, pparg3)

  fun pzip_source_free(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_free(pparg0)

  fun pzip_source_keep(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_keep(pparg0)

  fun pzip_source_open(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_open(pparg0)

  fun pzip_source_read(pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[U8] tag, pparg2: U64): I64 =>
    @zip_source_read(pparg0, pparg1, pparg2)

  fun pzip_source_rollback_write(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_rollback_write(pparg0)

  fun pzip_source_seek(pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32): I32 =>
    @zip_source_seek(pparg0, pparg1, pparg2)

  fun pzip_source_seek_compute_offset(pparg0: U64, pparg1: U64, pparg2: Pointer[U8] tag, pparg3: U64, pparg4: NullablePointer[Ziperror] tag): I64 =>
    @zip_source_seek_compute_offset(pparg0, pparg1, pparg2, pparg3, pparg4)

  fun pzip_source_seek_write(pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32): I32 =>
    @zip_source_seek_write(pparg0, pparg1, pparg2)

  fun pzip_source_stat(pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipstat] tag): I32 =>
    @zip_source_stat(pparg0, pparg1)

  fun pzip_source_tell(pparg0: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell(pparg0)

  fun pzip_source_tell_write(pparg0: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell_write(pparg0)

  fun pzip_source_write(pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[U8] tag, pparg2: U64): I64 =>
    @zip_source_write(pparg0, pparg1, pparg2)

  fun pzip_source_zip(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zip] tag, pparg2: U64, pparg3: U32, pparg4: U64, pparg5: I64): NullablePointer[Zipsource] =>
    @zip_source_zip(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)

  fun pzip_unchange(pparg0: NullablePointer[Zip] tag, pparg1: U64): I32 =>
    @zip_unchange(pparg0, pparg1)

  fun pzip_unchange_all(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_all(pparg0)

  fun pzip_unchange_archive(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_archive(pparg0)

  fun pzip_compression_method_supported(pmethod: I32, pcompress: I32): I32 =>
    @zip_compression_method_supported(pmethod, pcompress)

  fun pzip_encryption_method_supported(pmethod: U16, pencode: I32): I32 =>
    @zip_encryption_method_supported(pmethod, pencode)


  /* Error Handling */
  fun pzip_get_error(pparg0: NullablePointer[Zip] tag): NullablePointer[Ziperror] =>
    @zip_get_error(pparg0)

  fun pzip_error_clear(pparg0: NullablePointer[Zip] tag): None =>
    @zip_error_clear(pparg0)

  fun pzip_error_code_zip(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_zip(pparg0)

  fun pzip_error_code_system(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_system(pparg0)

  fun pzip_error_fini(pparg0: NullablePointer[Ziperror] tag): None =>
    @zip_error_fini(pparg0)

  fun pzip_error_init(pparg0: NullablePointer[Ziperror] tag): None =>
    @zip_error_init(pparg0)

  fun pzip_error_init_with_code(pparg0: NullablePointer[Ziperror] tag, pparg1: I32): None =>
    @zip_error_init_with_code(pparg0, pparg1)

  fun pzip_error_set(pparg0: NullablePointer[Ziperror] tag, pparg1: I32, pparg2: I32): None =>
    @zip_error_set(pparg0, pparg1, pparg2)

  fun pzip_error_strerror(pparg0: NullablePointer[Ziperror] tag): String =>
    var pcstring: Pointer[U8] = @zip_error_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_error_system_type(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_system_type(pparg0)

  fun pzip_error_to_data(pparg0: NullablePointer[Ziperror] tag, pparg1: Pointer[U8] tag, pparg2: U64): I64 =>
    @zip_error_to_data(pparg0, pparg1, pparg2)

  fun pzip_file_error_clear(pparg0: NullablePointer[Zipfile] tag): None =>
    @zip_file_error_clear(pparg0)

  fun pzip_file_get_error(pparg0: NullablePointer[Zipfile] tag): NullablePointer[Ziperror] =>
    @zip_file_get_error(pparg0)

  fun pzip_file_strerror(pparg0: NullablePointer[Zipfile] tag): String =>
    var pcstring: Pointer[U8] = @zip_file_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_strerror(pparg0: NullablePointer[Zip] tag): String =>
    var pcstring: Pointer[U8] = @zip_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  /* Misc */
  fun pzip_libzip_version(): String =>
    var pcstring: Pointer[U8] = @zip_libzip_version()
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzip_source_is_deleted(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_is_deleted(pparg0)


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
