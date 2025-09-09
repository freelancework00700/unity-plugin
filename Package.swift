// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Unity",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Unity",
            targets: ["UnityPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "UnityPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/UnityPlugin"),
        .testTarget(
            name: "UnityPluginTests",
            dependencies: ["UnityPlugin"],
            path: "ios/Tests/UnityPluginTests")
    ]
)