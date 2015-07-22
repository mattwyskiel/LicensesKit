//
//  BSD3ClauseLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class BSD3ClauseLicense: License {
    
    override public var name: String {
        get {
            return "BSD 3-Clause License"
        }
    }
    
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "bsd3_summary")
        }
    }
    
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "bsd3_full")
        }
    }
    
    override public var version: String {
        get {
            return ""
        }
    }
    
    override public var url: String {
        get {
            return "http://opensource.org/licenses/BSD-3-Clause"
        }
    }
    
}
