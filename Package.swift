// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CalendarView",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CalendarView",
            targets: ["CalendarView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CalendarView",
            dependencies: []),
        .testTarget(
            name: "CalendarViewTests",
            dependencies: ["CalendarView"]),
    ]
)
