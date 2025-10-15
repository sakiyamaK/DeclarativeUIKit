// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeUIKit",
    platforms: [
            .iOS(.v15),
        ],
    products: [
        .library(name: "DeclarativeUIKit", targets: ["DeclarativeUIKit"]),
    ],
    targets: [
        .target(name: "DeclarativeUIKit", path: "Sources"),
        .testTarget(name: "DeclarativeUIKitTests", dependencies: ["DeclarativeUIKit"]),
    ],
    swiftLanguageModes: [
        .v6
    ]
)
