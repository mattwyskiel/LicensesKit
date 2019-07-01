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
public struct License: Decodable {
    
    /// The name of the license
    public var name: String
    
    /// The license summary text
    public var summaryText: String?
    
    /// The license full text
    public var fullText: String
    
    /// The license version
    public var version: String?
    
    /// The license URL
    public var url: URL
   
}

/// Fetches license content from disk
public class LicenseContentFetcher {
    public class var bundle: Bundle {
        return Bundle(for: LicenseContentFetcher.self)
    }
    
    /**
    Gets license content from a .txt file on disk.
    
    - parameter filename: The name of the .txt file containing license content, excluding extension
    - parameter bundle: The bundle that this file is in.
    
    - returns: The content of the .txt file specified.
    */
    public class func getContent(fromFileNamed filename: String, in bundle: Bundle = bundle) -> String! {
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
