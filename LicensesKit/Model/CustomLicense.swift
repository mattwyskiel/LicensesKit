//
//  CustomLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class CustomLicense: License {
    
    /// The name of the license
    override public var name: String {
        get {
            return "My Awesome, Restrictive, Ownership License"
        }
        set {
            self.name = newValue
        }
    }
    
    /// The license summary text
    override public var summaryText: String {
        get {
            return "I own this."
        }
        set {
            self.summaryText = newValue
        }
    }
    
    /// The license full text
    override public var fullText: String {
        get {
            return "I own this. Period."
        }
        set {
            self.fullText = newValue
        }
    }
    
    /// The license version
    override public var version: String {
        get {
            return "1.0"
        }
        set {
            self.version = newValue
        }
    }
    
    /// The license URL
    override public var url: String {
        get {
            return "http://example.com/license/url"
        }
        set {
            self.url = newValue
        }
    }
    
    public init(name: String, summaryText: String, fullText: String, version: String, url: String) {
        super.init()
        self.name = name
        self.summaryText = summaryText
        self.fullText = fullText
        self.version = version
        self.url = url
    }
   
}
