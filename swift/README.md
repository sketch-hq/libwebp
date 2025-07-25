# Prebuilt WebP XCFramework bundles

This folder contains the `WebP.xcframework` and `SharpY.xcframework` bundles generated from the sources described below by running the following commands in the source root (parent directory).

- **Source**: https://chromium.googlesource.com/webm/libwebp/+/refs/heads/1.6.0, 
- **Commit**: 4fa21912338357f89e4fd51cf2368325b59e9bd9

Start by building the XCFramework bundles.

```bash
./autogen.sh
./xcframeworkbuild.sh
```

Then, there's one change required in the generated `WebP.xcframework` to add `module.modulemap`. This allows the `WebP` module to be imported in Swift. This modulemap file needs to be included in the `Headers` folder of every supported architecture of `WebP.xcframework`. The `copy-modulemap.sh` script does just that.


```bash
./swift/copy-modulemap.sh
```

The resulting `WebP.xcframework` and `SharpYuv.xcframework` bundles must then be zipped and moved to `./swift/` directory, as per the Package.swift definition. To zip and move the frameworks:

```bash
zip -r WebP.xcframework.zip WebP.xcframework
zip -r SharpYuv.xcframework.zip SharpYuv.xcframework
mv WebP.xcframework.zip ./swift/
mv SharpYuv.xcframework.zip ./swift/
```

> [!NOTE]
> `SharpYUV` is a mandatory dependency of WebP and it has to be included and linked separately in the Sketch workspace.

The main Sketch Xcode workspace will now reference the Swift Package Manager package located in the `./swift/` directory.
