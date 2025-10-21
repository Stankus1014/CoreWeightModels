// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreWeightModels",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreWeightModels",
            targets: ["CoreWeightModels"]
        ),
    ],
    targets: [
        .target(
            name: "CoreWeightModels"
        ),

    ]
)
