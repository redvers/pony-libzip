use @zip_add[I64](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: NullablePointer[Zipsource] tag)
use @zip_add_dir[I64](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag)
use @zip_get_file_comment[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[I32] tag, pparg3: I32)
use @zip_get_num_files[I32](pparg0: NullablePointer[Zip] tag)
use @zip_rename[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U8] tag)
use @zip_replace[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag)
use @zip_set_file_comment[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U8] tag, pparg3: I32)
use @zip_error_get_sys_type[I32](pparg0: I32)
use @zip_error_get[None](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag)
use @zip_error_to_str[I32](pparg0: Pointer[U8] tag, pparg1: U64, pparg2: I32, pparg3: I32)
use @zip_file_error_get[None](pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag)
use @zip_close[I32](pparg0: NullablePointer[Zip] tag)
use @zip_delete[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64)
use @zip_dir_add[I64](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U32)
use @zip_discard[None](pparg0: NullablePointer[Zip] tag)
use @zip_get_error[NullablePointer[Ziperror]](pparg0: NullablePointer[Zip] tag)
use @zip_error_clear[None](pparg0: NullablePointer[Zip] tag)
use @zip_error_code_zip[I32](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_code_system[I32](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_fini[None](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_init[None](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_init_with_code[None](pparg0: NullablePointer[Ziperror] tag, pparg1: I32)
use @zip_error_set[None](pparg0: NullablePointer[Ziperror] tag, pparg1: I32, pparg2: I32)
use @zip_error_strerror[Pointer[U8]](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_system_type[I32](pparg0: NullablePointer[Ziperror] tag)
use @zip_error_to_data[I64](pparg0: NullablePointer[Ziperror] tag, pparg1: Pointer[None] tag, pparg2: U64)
use @zip_fclose[I32](pparg0: NullablePointer[Zipfile] tag)
use @zip_fdopen[NullablePointer[Zip]](pparg0: I32, pparg1: I32, pparg2: Pointer[I32] tag)
use @zip_file_add[I64](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: NullablePointer[Zipsource] tag, pparg3: U32)
use @zip_file_attributes_init[None](pparg0: NullablePointer[Zipfileattributes] tag)
use @zip_file_error_clear[None](pparg0: NullablePointer[Zipfile] tag)
use @zip_file_extra_field_delete[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32)
use @zip_file_extra_field_delete_by_id[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32)
use @zip_file_extra_field_set[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: Pointer[U8] tag, pparg5: U16, pparg6: U32)
use @zip_file_extra_fields_count[I16](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32)
use @zip_file_extra_fields_count_by_id[I16](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32)
use @zip_file_extra_field_get[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: Pointer[U16] tag, pparg4: Pointer[U16] tag, pparg5: U32)
use @zip_file_extra_field_get_by_id[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: Pointer[U16] tag, pparg5: U32)
use @zip_file_get_comment[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U32] tag, pparg3: U32)
use @zip_file_get_error[NullablePointer[Ziperror]](pparg0: NullablePointer[Zipfile] tag)
use @zip_file_get_external_attributes[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: Pointer[U8] tag, pparg4: Pointer[U32] tag)
use @zip_file_rename[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U8] tag, pparg3: U32)
use @zip_file_replace[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag, pparg3: U32)
use @zip_file_set_comment[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U8] tag, pparg3: U16, pparg4: U32)
use @zip_file_set_dostime[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32)
use @zip_file_set_encryption[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: Pointer[U8] tag)
use @zip_file_set_external_attributes[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: U8, pparg4: U32)
use @zip_file_set_mtime[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I64, pparg3: U32)
use @zip_file_strerror[Pointer[U8]](pparg0: NullablePointer[Zipfile] tag)
use @zip_fopen[NullablePointer[Zipfile]](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U32)
use @zip_fopen_encrypted[NullablePointer[Zipfile]](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U32, pparg3: Pointer[U8] tag)
use @zip_fopen_index[NullablePointer[Zipfile]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32)
use @zip_fopen_index_encrypted[NullablePointer[Zipfile]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: Pointer[U8] tag)
use @zip_fread[I64](pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[U8] tag, pparg2: U64)
use @zip_fseek[I8](pparg0: NullablePointer[Zipfile] tag, pparg1: I64, pparg2: I32)
use @zip_ftell[I64](pparg0: NullablePointer[Zipfile] tag)
use @zip_get_archive_comment[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: U32)
use @zip_get_archive_flag[I32](pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: U32)
use @zip_get_name[Pointer[U8]](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32)
use @zip_get_num_entries[I64](pparg0: NullablePointer[Zip] tag, pparg1: U32)
use @zip_libzip_version[Pointer[U8]]()
use @zip_name_locate[I64](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U32)
use @zip_open[NullablePointer[Zip]](pparg0: Pointer[U8] tag, pparg1: U32, pparg2: Pointer[I32] tag)
use @zip_open_from_source[NullablePointer[Zip]](pparg0: NullablePointer[Zipsource] tag, pparg1: U32, pparg2: Pointer[I32] tag)
use @zip_set_archive_comment[I32](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U16)
use @zip_set_archive_flag[I32](pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: I32)
use @zip_set_default_password[I32](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag)
use @zip_set_file_compression[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I32, pparg3: U32)
use @zip_source_begin_write[I32](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_begin_write_cloning[I32](pparg0: NullablePointer[Zipsource] tag, pparg1: U64)
use @zip_source_buffer[NullablePointer[Zipsource]](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[None] tag, pparg2: U64, pparg3: I32)
use @zip_source_buffer_create[NullablePointer[Zipsource]](pparg0: Pointer[None] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag)
use @zip_source_buffer_fragment[NullablePointer[Zipsource]](pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zipbufferfragment] tag, pparg2: U64, pparg3: I32)
use @zip_source_buffer_fragment_create[NullablePointer[Zipsource]](pparg0: NullablePointer[Zipbufferfragment] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag)
use @zip_source_close[I32](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_commit_write[I32](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_error[NullablePointer[Ziperror]](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_file[NullablePointer[Zipsource]](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U64, pparg3: I64)
use @zip_source_file_create[NullablePointer[Zipsource]](pparg0: Pointer[U8] tag, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag)
use @zip_source_filep[NullablePointer[Zipsource]](pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[IOFILE] tag, pparg2: U64, pparg3: I64)
use @zip_source_filep_create[NullablePointer[Zipsource]](pparg0: NullablePointer[IOFILE] tag, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag)
use @zip_source_free[None](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_get_file_attributes[I32](pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipfileattributes] tag)
use @zip_source_is_deleted[I32](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_keep[None](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_open[I32](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_read[I64](pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[None] tag, pparg2: U64)
use @zip_source_rollback_write[None](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_seek[I32](pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32)
use @zip_source_seek_compute_offset[I64](pparg0: U64, pparg1: U64, pparg2: Pointer[None] tag, pparg3: U64, pparg4: NullablePointer[Ziperror] tag)
use @zip_source_seek_write[I32](pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32)
use @zip_source_stat[I32](pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipstat] tag)
use @zip_source_tell[I64](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_tell_write[I64](pparg0: NullablePointer[Zipsource] tag)
use @zip_source_write[I64](pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[None] tag, pparg2: U64)
use @zip_source_zip[NullablePointer[Zipsource]](pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zip] tag, pparg2: U64, pparg3: U32, pparg4: U64, pparg5: I64)
use @zip_stat[I32](pparg0: NullablePointer[Zip] tag, pparg1: Pointer[U8] tag, pparg2: U32, pparg3: NullablePointer[Zipstat] tag)
use @zip_stat_index[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: NullablePointer[Zipstat] tag)
use @zip_stat_init[None](pparg0: NullablePointer[Zipstat] tag)
use @zip_strerror[Pointer[U8]](pparg0: NullablePointer[Zip] tag)
use @zip_unchange[I32](pparg0: NullablePointer[Zip] tag, pparg1: U64)
use @zip_unchange_all[I32](pparg0: NullablePointer[Zip] tag)
use @zip_unchange_archive[I32](pparg0: NullablePointer[Zip] tag)
use @zip_compression_method_supported[I32](pmethod: I32, pcompress: I32)
use @zip_encryption_method_supported[I32](pmethod: U16, pencode: I32)
