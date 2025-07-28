# Prebuilt WebP XCFramework bundles

This folder contains the `WebP.xcframework` and `SharpY.xcframework` bundles generated from the sources described below by running the following commands in the source root (parent directory).

- **Source**: https://chromium.googlesource.com/webm/libwebp/+/refs/heads/1.6.0, 
- **Commit**: 4fa21912338357f89e4fd51cf2368325b59e9bd9

```bash
./autogen.sh
./xcframeworkbuild.sh
```

The resulting `WebP.xcframework` and `SharpYuv.xcframework` bundles must then be copied to `./xcframeworks/` (this directory). That's where the main Sketch Xcode workspace will be referencing them.

> [!NOTE]
> `SharpYUV` is a mandatory dependency of WebP and it has to be included and linked separately in the Sketch workspace.

Lastly, there's one change required in `WebP.xcframework` to add `module.modulemap` so that the `WebP` module can be imported in Swift. This modulemap file needs to be included in the `Headers` folder of every supported architecture of `WebP.xcframework`. Run the following script to do just that.

```
./copy-modulemap.sh
```


