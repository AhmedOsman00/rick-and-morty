// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "UIExtensions",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "UIExtensions",
            targets: ["UIExtensions", "Router"]),
    ],
    dependencies: [
        .package(name: "DesignSystem", path: "../DesignSystem"),
    ],
    targets: [
        .target(
            name: "UIExtensions",
            dependencies: [
                "DesignSystem",
            ]),
        .target(name: "Router"),
    ]
)
