// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "iOSInterviewPrep",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "iOSInterviewPrep", targets: ["iOSInterviewPrep"]),
    ],
    targets: [
        .target(
            name: "iOSInterviewPrep",
            path: "Sources/iOSInterviewPrep"
        ),
        .testTarget(
            name: "iOSInterviewPrepTests",
            dependencies: ["iOSInterviewPrep"],
            path: "Tests/iOSInterviewPrepTests"
        ),
    ]
)
