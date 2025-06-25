NFDResult :: enum {
    NFD_ERROR :: 0; // programmatic error
    NFD_OKAY; // user pressed okay, or successful return
    NFD_CANCEL; // user pressed cancel
}

NFDPathSet :: struct {
    buf: *u8;
    indices: *u64; // byte offsets into buf
    count: u64; // number of indices into buf
}

NFD_OpenDialog :: (filterList: *u8, defaultPath: *u8, outPath: **u8) -> NFDResult #foreign nfd;

NFD_OpenDialogMultiple :: (filterList: *u8, defaultPath: *u8, outPaths: *NFDPathSet) -> NFDResult #foreign nfd;

NFD_SaveDialog :: (filterList: *u8, defaultPath: *u8, outPath: **u8) -> NFDResult #foreign nfd;

NFD_PickFolder :: (defaultPath: *u8, outPath: **u8) -> NFDResult #foreign nfd;

NFD_GetError :: () -> *u8 #foreign nfd;

NFD_PathSet_GetCount :: (pathSet: *NFDPathSet) -> u64 #foreign nfd;

NFD_PathSet_GetPath :: (pathSet: *NFDPathSet, index: u64) -> *u8 #foreign nfd;

NFD_PathSet_Free :: (pathSet: *NFDPathSet) #foreign nfd;

#scope_file

nfd :: #library "win/nativefiledialog";