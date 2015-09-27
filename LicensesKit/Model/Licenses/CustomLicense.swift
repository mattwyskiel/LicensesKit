//
//  CustomLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/**
Describes a library's license that is not one of the default licenses included with this library.
*/
@objc public class CustomLicense: NSObject, License {
    
    private var privateName: String = ""

    /// The name of the license
    public var name: String {
        get {
            return self.privateName
        }
        set {
            self.privateName = newValue
        }
    }
    
    private var privateSummaryText: String = ""
    /// The license summary text
    public var summaryText: String {
        get {
            return self.privateSummaryText
        }
        set {
            self.privateSummaryText = newValue
        }
    }
    
    private var privateFullText: String = ""
    /// The license full text
    public var fullText: String {
        get {
            return self.privateFullText
        }
        set {
            self.privateFullText = newValue
        }
    }
    
    private var privateVersion: String = ""
    /// The license version
    public var version: String {
        get {
            return self.privateVersion
        }
        set {
            self.privateVersion = newValue
        }
    }
    
    private var privateURL: String = ""
    /// The license URL
    public var url: String {
        get {
            return self.privateURL
        }
        set {
            self.privateURL = newValue
        }
    }
    
    /**
    The designated initializer for a CustomLicense object.
    
    - parameter name:        The name of the license
    - parameter summaryText: The license summary text
    - parameter fullText:    The license full text
    - parameter version:     The license version
    - parameter url:         The license URL
    
    - returns: An instance of CustomLicense
    */
    public init(name: String, summaryText: String, fullText: String, version: String, url: String) {
        super.init()
        self.name = name
        self.summaryText = summaryText
        self.fullText = fullText
        self.version = version
        self.url = url
    }
    
    private override init() {
        
    }
   
}

/// Equatable conformance - defining equivalence for `CustomLicense`
public func ==(lhs: CustomLicense, rhs: CustomLicense) -> Bool {
    return lhs.name == rhs.name
}