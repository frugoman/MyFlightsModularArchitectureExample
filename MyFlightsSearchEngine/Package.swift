// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MyFlightsSearchEngine",
    platforms: [
        .macOS(.v10_14), .iOS(.v10)
        ],
    products: [
        .library(
            name: "MyFlightsSearchEngine",
            targets: ["MyFlightsSearchEngine"]),
    ],
    targets: [
        .target(
            name: "MyFlightsSearchEngine",
            dependencies: []),
        .testTarget(
            name: "MyFlightsSearchEngineTests",
            dependencies: ["MyFlightsSearchEngine"]),
    ]
)
