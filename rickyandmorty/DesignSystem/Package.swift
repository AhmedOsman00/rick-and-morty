// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "DesignSystem",
  defaultLocalization: "en",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "DesignSystem",
      targets: ["DesignSystem"]
    ),
  ],
  targets: [
    .target(name: "DesignSystem"),
  ]
)
