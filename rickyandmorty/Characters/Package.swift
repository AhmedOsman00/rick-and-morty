// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Characters",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Characters", targets: ["Characters"])
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.20.0"),
        .package(name: "NetworkingFacade", path: "../NetworkingFacade"),
        .package(name: "DesignSystem", path: "../DesignSystem"),
        .package(name: "UIExtensions", path: "../UIExtensions"),
    ],
    targets: [
        .target(name: "Characters",
                dependencies: [
                    "DesignSystem",
                    "UIExtensions",
                    "NetworkingFacade",
                    .product(name: "SDWebImage", package: "SDWebImage"),
                ]),
        .testTarget(
            name: "CharactersTests",
            dependencies: ["Characters"])
    ]
)
