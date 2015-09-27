//
//  CreativeCommonsAttributionNoDerivs30Unported.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// Creative Commons Attribution-NoDerivs 3.0 Unported
@objc public class CreativeCommonsAttributionNoDerivs30Unported: NSObject, License {
    
    /// The name of the license
    public var name: String {
        get {
            return "Creative Commons Attribution-NoDerivs 3.0 Unported"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "ccand_30_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "ccand_30_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "3.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://creativecommons.org/licenses/by-nd/3.0"
        }
    }
   
}
