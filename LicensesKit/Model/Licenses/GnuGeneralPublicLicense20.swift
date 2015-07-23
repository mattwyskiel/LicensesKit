//
//  GnuGeneralPublicLicense20.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// GNU General Public License 2.0
@objc public class GnuGeneralPublicLicense20: License {
    
    /// The name of the license
    override public var name: String {
        get {
            return "GNU General Public License 2.0"
        }
    }
    
    /// The license summary text
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "gpl_20_summary")
        }
    }
    
    /// The license full text
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "gpl_20_full")
        }
    }
    
    /// The license version
    override public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    override public var url: String {
        get {
            return "http://www.gnu.org/licenses/"
        }
    }
   
}