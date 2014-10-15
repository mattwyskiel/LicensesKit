//
//  CustomLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class CustomLicense: License {
    
    private var privateName: String

    /// The name of the license
    override public var name: String {
        get {
            return self.privateName
        }
        set {
            self.privateName = newValue
        }
    }
    
    private var privateSummaryText: String
    /// The license summary text
    override public var summaryText: String {
        get {
            return self.privateSummaryText
        }
        set {
            self.privateSummaryText = newValue
        }
    }
    
    private var privateFullText: String
    /// The license full text
    override public var fullText: String {
        get {
            return self.privateFullText
        }
        set {
            self.privateFullText = newValue
        }
    }
    
    private var privateVersion: String
    /// The license version
    override public var version: String {
        get {
            return self.privateVersion
        }
        set {
            self.privateVersion = newValue
        }
    }
    
    private var privateURL: String
    /// The license URL
    override public var url: String {
        get {
            return self.privateURL
        set {
            self.privateURL = newValue
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
