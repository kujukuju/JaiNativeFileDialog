### Native File Dialog

Example code:
```jai
out_path: *u8;
result: NFDResult = NFD_OpenDialog("png,jpg;pdf", null, *out_path);
if result == .NFD_OKAY {
    print("Opened: %\n", out_path);
}
```