//
//  CustomLicense.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class CustomLicense: NSObject {
    
    /// The name of the license
    public var name: String
    
    /// The license summary text
    public var summaryText: String
    
    /// The license full text
    public var fullText: String
    
    /// The license version
    public var version: String
    
    /// The license URL
    public var url: String
    
    public init(name: String, summaryText: String, fullText: String, version: String, url: String) {
        self.name = name
        self.summaryText = summaryText
        self.fullText = fullText
        self.version = version
        self.url = url
    }
   
}



extension CustomLicense: Hashable {
    // Hashable
    public override var hashValue: Int {
        get {
            return name.hashValue
        }
    }
}

// Equatable
public func ==(lhs: CustomLicense, rhs: CustomLicense) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

