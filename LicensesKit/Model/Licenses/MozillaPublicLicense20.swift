//
//  MozillaPublicLicense20.swift
//  
//
//  Created by Matthew Wyskiel on 7/23/15.
//
//

import UIKit

/// Mozilla Public License, Version 2.0
@objc public class MozillaPublicLicense20: NSObject, License {
    
    /// The name of the license
    public var name: String {
        get {
            return "Mozilla Public License, Version 2.0"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mpl_20_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mpl_20_full")
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
            return "https://www.mozilla.org/MPL/2.0/"
        }
    }
}
