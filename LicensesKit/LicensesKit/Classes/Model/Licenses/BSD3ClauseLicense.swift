//
//  BSD3ClauseLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// BSD 3-Clause License
public struct BSD3ClauseLicense: License {
    
    /// The name of the license
    public var name: String {
        get {
            return "BSD 3-Clause License"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(fromFileNamed: "bsd3_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(fromFileNamed: "bsd3_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return ""
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://opensource.org/licenses/BSD-3-Clause"
        }
    }
    
}
