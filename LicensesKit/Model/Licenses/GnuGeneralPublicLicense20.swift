//
//  GnuGeneralPublicLicense20.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class GnuGeneralPublicLicense20: License {
    
    override public var name: String {
        get {
            return "GNU General Public License 2.0"
        }
    }
    
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "gpl_20_summary")
        }
    }
    
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "gpl_20_full")
        }
    }
    
    override public var version: String {
        get {
            return "2.0"
        }
    }
    
    override public var url: String {
        get {
            return "http://www.gnu.org/licenses/"
        }
    }
   
}