### Native File Dialog

Example code:
```jai
path: *u8;
result: NFDResult = NFD_OpenDialog("png,jpg;pdf", null, *path);
defer free(path);

if result == .NFD_OKAY {
    out_string: string;
    out_string.data = path;
    while path[out_string.count] != 0 {
        out_string.count += 1;
    }

    print("Opened: %\n", out_string);
} else if result == .NFD_CANCEL {
    print("Cancelled.\n");
} else {
    error: *u8 = NFD_GetError();
    defer free(error);

    error_string: string;
    error_string.data = error;
    while error[error_string.count] != 0 {
        error_string.count += 1;
    }
    
    print("Error: %\n", error_string);
}
```