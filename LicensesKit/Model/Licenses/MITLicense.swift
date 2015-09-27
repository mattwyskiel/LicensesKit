//
//  MITLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// MIT License
@objc public class MITLicense: NSObject, License {
    
    /// The name of the license
    public var name: String {
        get {
            return "MIT License"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_full")
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
            return "http://opensource.org/licenses/MIT"
        }
    }
   
}