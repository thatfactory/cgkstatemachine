// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "CGKStateMachine",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
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
            from: "0.1.0"
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
