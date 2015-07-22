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
@objc public class License: NSObject, Hashable {
    
    /// The name of the license
    public var name: String {
        get {
            return "Apache Software License 2.0"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://www.apache.org/licenses/LICENSE-2.0.txt"
        }
    }
   
}

extension License: Hashable {
    /// Hashable conformance - the hash value for `License`
    public override var hashValue: Int {
        get {
            return name.hashValue
        }
    }
}

/// Equatable conformance - defining equivalence for `License`
public func ==(lhs: License, rhs: License) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

/// Fetches license content from disk
@objc public class LicenseContentFetcher {
    private class var bundle: NSBundle {
        return NSBundle(forClass: Notice.self)
    }
    
    /**
    Gets license content from a .txt file on disk.
    
    :param: filename The name of the .txt file containing license content, excluding extension
    :param: bundle The bundle that this file is in.
    
    :returns: The content of the .txt file specified.
    */
    public class func getContent(#filename: String, inBundle bundle: NSBundle = bundle) -> String! {
        if let path = bundle.pathForResource(filename, ofType: "txt") {
            var errorMaybe: NSError?
            let string = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &errorMaybe)
            if let error = errorMaybe {
                return nil
            } else {
                return string as! String;
            }
        } else {
            return nil
        }
    }
}
