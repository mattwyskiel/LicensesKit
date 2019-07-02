//
//  LicensesKitSpec.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 01/04/19.
//  Copyright © 2019 MattWyskiel. All rights reserved.
//

import Quick
import Nimble
@testable import LicensesKit

class LicensesKitSpec: QuickSpec {
    override func spec() {
        describe("LicensesKitSpec") {
            it("works") {
                expect(ISCLicense.name) == "ISC License"
            }
        }
    }
}
