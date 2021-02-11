// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TAReactorKitHelper",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v3)
    ],
    products: [
        .library(
            name: "TAReactorKitHelper",
            targets: ["TAReactorKitHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", .upToNextMajor(from: "3.0.0")),
    ],
    targets: [
        .target(
            name: "TAReactorKitHelper",
            dependencies: [
                "ReactorKit",
            ],
            path: "TAReactorKitHelper"
        ),
        .testTarget(
            name: "TAReactorKitHelperTests",
            dependencies: ["TAReactorKitHelper"],
            path: "TAReactorKitHelperTests"
        ),
    ]
)
