use "lib:zip"

struct IOFILE

primitive ABLibZIP
//  fun pzipregisterprogresscallback(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[FUNCTIONTYPE] tag): None =>
//    @zip_register_progress_callback(pparg0, pparg1)


  fun pzipadd(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: NullablePointer[Zipsource] tag): I64 =>
    @zip_add(pparg0, pparg1.cstring(), pparg2)


  fun pzipadddir(pparg0: NullablePointer[Zip] tag, pparg1: String): I64 =>
    @zip_add_dir(pparg0, pparg1.cstring())


  fun pzipgetfilecomment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[I32] tag, pparg3: I32): String =>
    var pcstring: Pointer[U8] = @zip_get_file_comment(pparg0, pparg1, pparg2, pparg3)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipgetnumfiles(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_get_num_files(pparg0)


  fun pziprename(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String): I32 =>
    @zip_rename(pparg0, pparg1, pparg2.cstring())


  fun pzipreplace(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag): I32 =>
    @zip_replace(pparg0, pparg1, pparg2)


  fun pzipsetfilecomment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: I32): I32 =>
    @zip_set_file_comment(pparg0, pparg1, pparg2.cstring(), pparg3)


  fun pziperrorgetsystype(pparg0: I32): I32 =>
    @zip_error_get_sys_type(pparg0)


  fun pziperrorget(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag): None =>
    @zip_error_get(pparg0, pparg1, pparg2)


  fun pziperrortostr(pparg0: String, pparg1: U64, pparg2: I32, pparg3: I32): I32 =>
    @zip_error_to_str(pparg0.cstring(), pparg1, pparg2, pparg3)


  fun pzipfileerrorget(pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[I32] tag, pparg2: Pointer[I32] tag): None =>
    @zip_file_error_get(pparg0, pparg1, pparg2)


  fun pzipclose(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_close(pparg0)


  fun pzipdelete(pparg0: NullablePointer[Zip] tag, pparg1: U64): I32 =>
    @zip_delete(pparg0, pparg1)


  fun pzipdiradd(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): I64 =>
    @zip_dir_add(pparg0, pparg1.cstring(), pparg2)


  fun pzipdiscard(pparg0: NullablePointer[Zip] tag): None =>
    @zip_discard(pparg0)


  fun pzipgeterror(pparg0: NullablePointer[Zip] tag): NullablePointer[Ziperror] =>
    @zip_get_error(pparg0)


  fun pziperrorclear(pparg0: NullablePointer[Zip] tag): None =>
    @zip_error_clear(pparg0)


  fun pziperrorcodezip(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_zip(pparg0)


  fun pziperrorcodesystem(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_code_system(pparg0)


  fun pziperrorfini(pparg0: NullablePointer[Ziperror] tag): None =>
    @zip_error_fini(pparg0)


  fun pziperrorinit(pparg0: NullablePointer[Ziperror] tag): None =>
    @zip_error_init(pparg0)


  fun pziperrorinitwithcode(pparg0: NullablePointer[Ziperror] tag, pparg1: I32): None =>
    @zip_error_init_with_code(pparg0, pparg1)


  fun pziperrorset(pparg0: NullablePointer[Ziperror] tag, pparg1: I32, pparg2: I32): None =>
    @zip_error_set(pparg0, pparg1, pparg2)


  fun pziperrorstrerror(pparg0: NullablePointer[Ziperror] tag): String =>
    var pcstring: Pointer[U8] = @zip_error_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pziperrorsystemtype(pparg0: NullablePointer[Ziperror] tag): I32 =>
    @zip_error_system_type(pparg0)


  fun pziperrortodata(pparg0: NullablePointer[Ziperror] tag, pparg1: Pointer[None] tag, pparg2: U64): I64 =>
    @zip_error_to_data(pparg0, pparg1, pparg2)


  fun pzipfclose(pparg0: NullablePointer[Zipfile] tag): I32 =>
    @zip_fclose(pparg0)


  fun pzipfdopen(pparg0: I32, pparg1: I32, pparg2: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_fdopen(pparg0, pparg1, pparg2)


  fun pzipfileadd(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: NullablePointer[Zipsource] tag, pparg3: U32): I64 =>
    @zip_file_add(pparg0, pparg1.cstring(), pparg2, pparg3)


  fun pzipfileattributesinit(pparg0: NullablePointer[Zipfileattributes] tag): None =>
    @zip_file_attributes_init(pparg0)


  fun pzipfileerrorclear(pparg0: NullablePointer[Zipfile] tag): None =>
    @zip_file_error_clear(pparg0)


  fun pzipfileextrafielddelete(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32): I32 =>
    @zip_file_extra_field_delete(pparg0, pparg1, pparg2, pparg3)


  fun pzipfileextrafielddeletebyid(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_extra_field_delete_by_id(pparg0, pparg1, pparg2, pparg3, pparg4)


  fun pzipfileextrafieldset(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: String, pparg5: U16, pparg6: U32): I32 =>
    @zip_file_extra_field_set(pparg0, pparg1, pparg2, pparg3, pparg4.cstring(), pparg5, pparg6)


  fun pzipfileextrafieldscount(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): I16 =>
    @zip_file_extra_fields_count(pparg0, pparg1, pparg2)


  fun pzipfileextrafieldscountbyid(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U32): I16 =>
    @zip_file_extra_fields_count_by_id(pparg0, pparg1, pparg2, pparg3)


  fun pzipfileextrafieldget(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: Pointer[U16] tag, pparg4: Pointer[U16] tag, pparg5: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipfileextrafieldgetbyid(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: Pointer[U16] tag, pparg5: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_extra_field_get_by_id(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipfilegetcomment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: Pointer[U32] tag, pparg3: U32): String =>
    var pcstring: Pointer[U8] = @zip_file_get_comment(pparg0, pparg1, pparg2, pparg3)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipfilegeterror(pparg0: NullablePointer[Zipfile] tag): NullablePointer[Ziperror] =>
    @zip_file_get_error(pparg0)


  fun pzipfilegetexternalattributes(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: String, pparg4: Pointer[U32] tag): I32 =>
    @zip_file_get_external_attributes(pparg0, pparg1, pparg2, pparg3.cstring(), pparg4)


  fun pzipfilerename(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: U32): I32 =>
    @zip_file_rename(pparg0, pparg1, pparg2.cstring(), pparg3)


  fun pzipfilereplace(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: NullablePointer[Zipsource] tag, pparg3: U32): I32 =>
    @zip_file_replace(pparg0, pparg1, pparg2, pparg3)


  fun pzipfilesetcomment(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: String, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_set_comment(pparg0, pparg1, pparg2.cstring(), pparg3, pparg4)


  fun pzipfilesetdostime(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: U16, pparg4: U32): I32 =>
    @zip_file_set_dostime(pparg0, pparg1, pparg2, pparg3, pparg4)


  fun pzipfilesetencryption(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U16, pparg3: String): I32 =>
    @zip_file_set_encryption(pparg0, pparg1, pparg2, pparg3.cstring())


  fun pzipfilesetexternalattributes(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: U8, pparg4: U32): I32 =>
    @zip_file_set_external_attributes(pparg0, pparg1, pparg2, pparg3, pparg4)


  fun pzipfilesetmtime(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I64, pparg3: U32): I32 =>
    @zip_file_set_mtime(pparg0, pparg1, pparg2, pparg3)


  fun pzipfilestrerror(pparg0: NullablePointer[Zipfile] tag): String =>
    var pcstring: Pointer[U8] = @zip_file_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipfopen(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): NullablePointer[Zipfile] =>
    @zip_fopen(pparg0, pparg1.cstring(), pparg2)


  fun pzipfopenencrypted(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32, pparg3: String): NullablePointer[Zipfile] =>
    @zip_fopen_encrypted(pparg0, pparg1.cstring(), pparg2, pparg3.cstring())


  fun pzipfopenindex(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): NullablePointer[Zipfile] =>
    @zip_fopen_index(pparg0, pparg1, pparg2)


  fun pzipfopenindexencrypted(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: String): NullablePointer[Zipfile] =>
    @zip_fopen_index_encrypted(pparg0, pparg1, pparg2, pparg3.cstring())


  fun pzipfread(pparg0: NullablePointer[Zipfile] tag, pparg1: Pointer[U8] tag, pparg2: U64): I64 =>
    @zip_fread(pparg0, pparg1, pparg2)


  fun pzipfseek(pparg0: NullablePointer[Zipfile] tag, pparg1: I64, pparg2: I32): I8 =>
    @zip_fseek(pparg0, pparg1, pparg2)


  fun pzipftell(pparg0: NullablePointer[Zipfile] tag): I64 =>
    @zip_ftell(pparg0)


  fun pzipgetarchivecomment(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[I32] tag, pparg2: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_archive_comment(pparg0, pparg1, pparg2)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipgetarchiveflag(pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: U32): I32 =>
    @zip_get_archive_flag(pparg0, pparg1, pparg2)


  fun pzipgetname(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32): String =>
    var pcstring: Pointer[U8] = @zip_get_name(pparg0, pparg1, pparg2)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipgetnumentries(pparg0: NullablePointer[Zip] tag, pparg1: U32): I64 =>
    @zip_get_num_entries(pparg0, pparg1)


  fun pziplibzipversion(): String =>
    var pcstring: Pointer[U8] = @zip_libzip_version()
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipnamelocate(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32): I64 =>
    @zip_name_locate(pparg0, pparg1.cstring(), pparg2)


  fun pzipopen(pparg0: String, pparg1: I32, pparg2: Pointer[I32] tag): NullablePointer[Zip] =>
    @zip_open(pparg0.cstring(), pparg1, pparg2)


  fun pzipopenfromsource(pparg0: NullablePointer[Zipsource] tag, pparg1: I32, pparg2: NullablePointer[Ziperror] tag): NullablePointer[Zip] =>
    @zip_open_from_source(pparg0, pparg1, pparg2)


//  fun pzipregisterprogresscallbackwithstate(pparg0: NullablePointer[Zip] tag, pparg1: F64, pparg2: NullablePointer[FUNCTIONTYPE] tag, pparg3: NullablePointer[FUNCTIONTYPE] tag, pparg4: Pointer[None] tag): I32 =>
//    @zip_register_progress_callback_with_state(pparg0, pparg1, pparg2, pparg3, pparg4)


//  fun pzipregistercancelcallbackwithstate(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[FUNCTIONTYPE] tag, pparg2: NullablePointer[FUNCTIONTYPE] tag, pparg3: Pointer[None] tag): I32 =>
//    @zip_register_cancel_callback_with_state(pparg0, pparg1, pparg2, pparg3)


  fun pzipsetarchivecomment(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U16): I32 =>
    @zip_set_archive_comment(pparg0, pparg1.cstring(), pparg2)


  fun pzipsetarchiveflag(pparg0: NullablePointer[Zip] tag, pparg1: U32, pparg2: I32): I32 =>
    @zip_set_archive_flag(pparg0, pparg1, pparg2)


  fun pzipsetdefaultpassword(pparg0: NullablePointer[Zip] tag, pparg1: String): I32 =>
    @zip_set_default_password(pparg0, pparg1.cstring())


  fun pzipsetfilecompression(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: I32, pparg3: U32): I32 =>
    @zip_set_file_compression(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcebeginwrite(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_begin_write(pparg0)


  fun pzipsourcebeginwritecloning(pparg0: NullablePointer[Zipsource] tag, pparg1: U64): I32 =>
    @zip_source_begin_write_cloning(pparg0, pparg1)


  fun pzipsourcebuffer(pparg0: NullablePointer[Zip] tag, pparg1: Pointer[None] tag, pparg2: U64, pparg3: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcebuffercreate(pparg0: Pointer[None] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_create(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcebufferfragment(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zipbufferfragment] tag, pparg2: U64, pparg3: I32): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcebufferfragmentcreate(pparg0: NullablePointer[Zipbufferfragment] tag, pparg1: U64, pparg2: I32, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_buffer_fragment_create(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourceclose(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_close(pparg0)


  fun pzipsourcecommitwrite(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_commit_write(pparg0)


  fun pzipsourceerror(pparg0: NullablePointer[Zipsource] tag): NullablePointer[Ziperror] =>
    @zip_source_error(pparg0)


  fun pzipsourcefile(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U64, pparg3: I64): NullablePointer[Zipsource] =>
    @zip_source_file(pparg0, pparg1.cstring(), pparg2, pparg3)


  fun pzipsourcefilecreate(pparg0: String, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_file_create(pparg0.cstring(), pparg1, pparg2, pparg3)


  fun pzipsourcefilep(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[IOFILE] tag, pparg2: U64, pparg3: I64): NullablePointer[Zipsource] =>
    @zip_source_filep(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcefilepcreate(pparg0: NullablePointer[IOFILE] tag, pparg1: U64, pparg2: I64, pparg3: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
    @zip_source_filep_create(pparg0, pparg1, pparg2, pparg3)


  fun pzipsourcefree(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_free(pparg0)


//  fun pzipsourcefunction(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[FUNCTIONTYPE] tag, pparg2: Pointer[None] tag): NullablePointer[Zipsource] =>
//    @zip_source_function(pparg0, pparg1, pparg2)


//  fun pzipsourcefunctioncreate(pparg0: NullablePointer[FUNCTIONTYPE] tag, pparg1: Pointer[None] tag, pparg2: NullablePointer[Ziperror] tag): NullablePointer[Zipsource] =>
//    @zip_source_function_create(pparg0, pparg1, pparg2)


  fun pzipsourcegetfileattributes(pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipfileattributes] tag): I32 =>
    @zip_source_get_file_attributes(pparg0, pparg1)


  fun pzipsourceisdeleted(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_is_deleted(pparg0)


  fun pzipsourcekeep(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_keep(pparg0)


  fun pzipsourceopen(pparg0: NullablePointer[Zipsource] tag): I32 =>
    @zip_source_open(pparg0)


  fun pzipsourceread(pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[None] tag, pparg2: U64): I64 =>
    @zip_source_read(pparg0, pparg1, pparg2)


  fun pzipsourcerollbackwrite(pparg0: NullablePointer[Zipsource] tag): None =>
    @zip_source_rollback_write(pparg0)


  fun pzipsourceseek(pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32): I32 =>
    @zip_source_seek(pparg0, pparg1, pparg2)


  fun pzipsourceseekcomputeoffset(pparg0: U64, pparg1: U64, pparg2: Pointer[None] tag, pparg3: U64, pparg4: NullablePointer[Ziperror] tag): I64 =>
    @zip_source_seek_compute_offset(pparg0, pparg1, pparg2, pparg3, pparg4)


  fun pzipsourceseekwrite(pparg0: NullablePointer[Zipsource] tag, pparg1: I64, pparg2: I32): I32 =>
    @zip_source_seek_write(pparg0, pparg1, pparg2)


  fun pzipsourcestat(pparg0: NullablePointer[Zipsource] tag, pparg1: NullablePointer[Zipstat] tag): I32 =>
    @zip_source_stat(pparg0, pparg1)


  fun pzipsourcetell(pparg0: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell(pparg0)


  fun pzipsourcetellwrite(pparg0: NullablePointer[Zipsource] tag): I64 =>
    @zip_source_tell_write(pparg0)


  fun pzipsourcewrite(pparg0: NullablePointer[Zipsource] tag, pparg1: Pointer[None] tag, pparg2: U64): I64 =>
    @zip_source_write(pparg0, pparg1, pparg2)


  fun pzipsourcezip(pparg0: NullablePointer[Zip] tag, pparg1: NullablePointer[Zip] tag, pparg2: U64, pparg3: U32, pparg4: U64, pparg5: I64): NullablePointer[Zipsource] =>
    @zip_source_zip(pparg0, pparg1, pparg2, pparg3, pparg4, pparg5)


  fun pzipstat(pparg0: NullablePointer[Zip] tag, pparg1: String, pparg2: U32, pparg3: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat(pparg0, pparg1.cstring(), pparg2, pparg3)


  fun pzipstatindex(pparg0: NullablePointer[Zip] tag, pparg1: U64, pparg2: U32, pparg3: NullablePointer[Zipstat] tag): I32 =>
    @zip_stat_index(pparg0, pparg1, pparg2, pparg3)


  fun pzipstatinit(pparg0: NullablePointer[Zipstat] tag): None =>
    @zip_stat_init(pparg0)


  fun pzipstrerror(pparg0: NullablePointer[Zip] tag): String =>
    var pcstring: Pointer[U8] = @zip_strerror(pparg0)
    let p: String iso = String.from_cstring(pcstring).clone()
    consume p

  fun pzipunchange(pparg0: NullablePointer[Zip] tag, pparg1: U64): I32 =>
    @zip_unchange(pparg0, pparg1)


  fun pzipunchangeall(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_all(pparg0)


  fun pzipunchangearchive(pparg0: NullablePointer[Zip] tag): I32 =>
    @zip_unchange_archive(pparg0)


  fun pzipcompressionmethodsupported(pmethod: I32, pcompress: I32): I32 =>
    @zip_compression_method_supported(pmethod, pcompress)


  fun pzipencryptionmethodsupported(pmethod: U16, pencode: I32): I32 =>
    @zip_encryption_method_supported(pmethod, pencode)


