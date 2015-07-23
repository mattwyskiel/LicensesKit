//
//  MITLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// MIT License
@objc public class MITLicense: License {
    
    /// The name of the license
    override public var name: String {
        get {
            return "MIT License"
        }
    }
    
    /// The license summary text
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_summary")
        }
    }
    
    /// The license full text
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_full")
        }
    }
    
    /// The license version
    override public var version: String {
        get {
            return ""
        }
    }
    
    /// The license URL
    override public var url: String {
        get {
            return "http://opensource.org/licenses/MIT"
        }
    }
   
}