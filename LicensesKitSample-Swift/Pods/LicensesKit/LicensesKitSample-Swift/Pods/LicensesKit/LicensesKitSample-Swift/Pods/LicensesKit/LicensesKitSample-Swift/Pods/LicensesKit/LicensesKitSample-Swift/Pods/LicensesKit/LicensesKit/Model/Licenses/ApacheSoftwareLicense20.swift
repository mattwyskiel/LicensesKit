//
//  ApacheSoftwareLicense20.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class ApacheSoftwareLicense20: License {
    
    override public var name: String {
        get {
            return "Apache Software License 2.0"
        }
    }
    
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_summary")
        }
    }
    
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_full")
        }
    }
    
    override public var version: String {
        get {
            return "2.0"
        }
    }
    
    override public var url: String {
        get {
            return "http://www.apache.org/licenses/LICENSE-2.0.txt"
        }
    }
   
}
