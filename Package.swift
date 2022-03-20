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
        .package(path: ".//DebugPane"),
        .package(url: "https://github.com/duraidabdul/LocalConsole", .branch("main")),
    ],
    targets: [
        .target(
            name: "DebugPane_LocalConsole",
            dependencies: [
                "DebugPane",
                "LocalConsole",
            ]
        ),
        .testTarget(
            name: "DebugPane_LocalConsoleTests",
            dependencies: ["DebugPane_LocalConsole"]
        ),
    ]
)
