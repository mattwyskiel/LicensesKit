// swift-tools-version:5.1
//
//  LicensesKit.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 01/04/19.
//  Copyright © 2019 MattWyskiel. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "LicensesKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LicensesKit",
            targets: ["LicensesKit"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LicensesKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "LicensesKitTests",
            dependencies: ["LicensesKit"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
