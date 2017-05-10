//
//  License.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit
/**
  Describes a library's license
*/
public protocol License {
    
    /// The name of the license
    var name: String {
        get
    }
    
    /// The license summary text
    var summaryText: String {
        get
    }
    
    /// The license full text
    var fullText: String {
        get
    }
    
    /// The license version
    var version: String {
        get
    }
    
    /// The license URL
    var url: String {
        get
    }
   
}

/// Fetches license content from disk
@objc public class LicenseContentFetcher: NSObject {
    private class var bundle: Bundle {
        return Bundle(for: Notice.self)
    }
    
    /**
    Gets license content from a .txt file on disk.
    
    - parameter filename: The name of the .txt file containing license content, excluding extension
    - parameter bundle: The bundle that this file is in.
    
    - returns: The content of the .txt file specified.
    */
    public class func getContent(filename: String, inBundle bundle: Bundle = bundle) -> String! {
        if let path = bundle.path(forResource: filename, ofType: "txt") {
            let string: NSString?
            do {
                string = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                return string! as String;
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
