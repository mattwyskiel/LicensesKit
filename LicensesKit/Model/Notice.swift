//
//  Notice.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/**
*  The Notice object is made up of the library name, url, copyright, and license. You pass instances to this object to the LicensesViewController for display (or just list the notices in a json file).
*/
@objc public class Notice: NSObject {
    
    /// The name of the library
    var name: String
    /// The library url. Usually a github url but in some cases another url is more useful (like a library website url)
    var url: String
    /// The copyright (usually in format "Copyright (c) [YEAR] [NAME]")
    var copyright: String
    /// The license of the library. Either use a standard license or create a CustomLicense instance
    var license: License?
    
    /**
    The designated initializer for the Notice object
    
    - parameter name:      The name of the library
    - parameter url:       The library url
    - parameter copyright: The copyright info for the library. (See the "copyright" property
    - parameter license:   The license of the library. Either use a standard license or create a CustomLicense instance
    
    - returns: An instance of the Notice object
    */
    public init(name: String, url: String, copyright: String, license: License) {
        self.name = name
        self.url = url
        self.copyright = copyright
        self.license = license
    }
   
}
