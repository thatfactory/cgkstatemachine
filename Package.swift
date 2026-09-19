// swift-tools-version:6.4

import PackageDescription

let strictSwiftSettings: [SwiftSetting] = [
    .treatAllWarnings(as: .error),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
]

let package = Package(
    name: "CGKStateMachine",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
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
        ),
    ]
)

package.swiftLanguageModes = [.v6]

for target in package.targets {
    target.swiftSettings = strictSwiftSettings
}
