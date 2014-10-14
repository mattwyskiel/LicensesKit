//
//  MITLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class MITLicense: License {
    
    override public var name: String {
        get {
            return "MIT License"
        }
    }
    
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_summary")
        }
    }
    
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "mit_full")
        }
    }
    
    override public var version: String {
        get {
            return ""
        }
    }
    
    override public var url: String {
        get {
            return "http://opensource.org/licenses/MIT"
        }
    }
   
}