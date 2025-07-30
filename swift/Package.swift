// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "WebP",
  platforms: [
    .iOS(.v18), .macOS(.v14),
  ],
  products: [
    .library(
      name: "SharpYuv",
      targets: ["SharpYuv"]
    ),
    .library(
      name: "WebPMux",
      targets: ["WebPMux"]
    ),
    .library(
      name: "WebP",
      targets: ["WebP"]
    )
  ],
  targets: [
    .binaryTarget(
      name: "SharpYuv",
      path: "./SharpYuv.xcframework.zip"
    ),
    .binaryTarget(
      name: "WebPMux",
      path: "./WebPMux.xcframework.zip"
    ),
    .binaryTarget(
      name: "WebP",
      path: "./WebP.xcframework.zip"
    )
  ]
)
