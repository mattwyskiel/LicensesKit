//
//  CreativeCommonsAttributionNoDerivs30Unported.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class CreativeCommonsAttributionNoDerivs30Unported: License {
    
    override public var name: String {
        get {
            return "Creative Commons Attribution-NoDerivs 3.0 Unported"
        }
    }
    
    override public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "ccand_30_summary")
        }
    }
    
    override public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "ccand_30_full")
        }
    }
    
    override public var version: String {
        get {
            return "3.0"
        }
    }
    
    override public var url: String {
        get {
            return "http://creativecommons.org/licenses/by-nd/3.0"
        }
    }
   
}
