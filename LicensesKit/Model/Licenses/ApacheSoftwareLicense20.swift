//
//  ApacheSoftwareLicense20.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// Apache Software License, Version 2.0
@objc public class ApacheSoftwareLicense20: NSObject, License {
    
    /// The name of the license
    public var name: String {
        get {
            return "Apache Software License 2.0"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://www.apache.org/licenses/LICENSE-2.0.txt"
        }
    }
   
}
