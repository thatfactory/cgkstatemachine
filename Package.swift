// swift-tools-version:6.4

import PackageDescription

let package = Package(
    name: "CGKStateMachine",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(
            name: "CGKStateMachine",
            targets: ["CGKStateMachine"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/thatfactory/applogger",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "CGKStateMachine",
            dependencies: [
                .product(
                    name: "AppLogger",
                    package: "applogger"
                )
            ]
        ),
        .testTarget(
            name: "CGKStateMachineTests",
            dependencies: ["CGKStateMachine"]
        )
    ]
)
