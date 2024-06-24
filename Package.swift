// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DebugPane_LocalConsole",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "DebugPane_LocalConsole",
            targets: ["DebugPane_LocalConsole"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/antranapp/DebugPane",
            .branch("master")
        ),
        .package(
            url: "https://github.com/duraidabdul/LocalConsole",
            .branch("main")
        ),
        .package(
            url: "https://github.com/apple/swift-log",
            .upToNextMajor(from: "1.6.1")
        )
    ],
    targets: [
        .target(
            name: "DebugPane_LocalConsole",
            dependencies: [
                "DebugPane",
                "LocalConsole",
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "DebugPane_LocalConsoleTests",
            dependencies: ["DebugPane_LocalConsole"]
        ),
    ]
)
