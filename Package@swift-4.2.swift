// swift-tools-version:4.2
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
    swiftLanguageVersions: [.v4, .v4_2]
)
