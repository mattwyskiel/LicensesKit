//
//  GnuLesserGeneralPublicLicense21.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// GNU Lesser General Public License 2.1
public struct GnuLesserGeneralPublicLicense21: License {
    
    /// The name of the license
    public var name: String {
        get {
            return "GNU Lesser General Public License 2.1"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(fromFileNamed: "lgpl_21_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(fromFileNamed: "lgpl_21_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "2.1"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html"
        }
    }
    
}
