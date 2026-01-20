// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "NetworkingFacade",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "NetworkingFacade",
      targets: ["NetworkingFacade"]
    ),
  ],
  dependencies: [
      .package(url: "https://github.com/AhmedOsman00/networking", from: "1.0.1"),
  ],
  targets: [
    .target(name: "NetworkingFacade",
            dependencies: [
                .product(name: "Networking", package: "networking"),
                .product(name: "Pager", package: "networking")
            ]),
    .testTarget(
        name: "NetworkingFacadeTests",
        dependencies: ["NetworkingFacade"])
  ]
)
