# Prebuilt WebP XCFramework bundles

This folder contains the zipped XCFramework bundles after generated from the source in the parent directory.

- `WebP.xcframework`: Main WebP library.
- `WebPMux.xcframework`: Dependency of the main library necessary to include ICCP data in the exported data.
- `SharpY.xcframework`: Mandatory dependency of the main WebP library.

The parent directory is a snapshot of the following source:

- **Source**: https://chromium.googlesource.com/webm/libwebp/+/refs/heads/1.6.0, 
- **Commit**: 4fa21912338357f89e4fd51cf2368325b59e9bd9

The commands used to build all XCFramework bundles are:

```bash
./autogen.sh
./xcframeworkbuild.sh
```

Then, there's one change required in the generated `WebP.xcframework` to add `module.modulemap`. This allows the `WebP` module to be imported in Swift. This modulemap file needs to be included in the `Headers` folder of every supported architecture of `WebP.xcframework`. The `copy-modulemap.sh` script does just that.


```bash
./swift/copy-modulemap.sh
```

The resulting `WebP.xcframework`, `WebPMux.xcframework` and `SharpYuv.xcframework` bundles must then be zipped and moved to `./swift/` directory, as per the Package.swift definition. To zip and move the frameworks:

```bash
zip -r WebP.xcframework.zip WebP.xcframework
zip -r WebPMux.xcframework.zip WebPMux.xcframework
zip -r SharpYuv.xcframework.zip SharpYuv.xcframework
mv WebP.xcframework.zip ./swift/
mv WebPMux.xcframework.zip ./swift/
mv SharpYuv.xcframework.zip ./swift/
```

> [!NOTE]
> `SharpYUV` is a mandatory dependency of WebP and it has to be included and linked separately in the Sketch workspace.

> [!NOTE]
> `WebPMux` is not a mandatory dependency of WebP but Sketch (`SketchRendering.MSWebPExporter`) uses it to include color profile data in the exported data.

The main Sketch Xcode workspace will now reference the Swift Package Manager package located in the `./swift/` directory.
