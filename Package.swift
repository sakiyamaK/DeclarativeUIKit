// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeUIKit",
    platforms: [
            .iOS(.v15)
        ],
    products: [
        .library(name: "DeclarativeUIKit", targets: ["DeclarativeUIKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
    ],
    targets: [
        .target(name: "DeclarativeUIKit", dependencies: [], path: "Sources"),
        .testTarget(name: "DeclarativeUIKitTests", dependencies: ["DeclarativeUIKit"])
    ],
    swiftLanguageModes: [
        .v6
    ]
)
