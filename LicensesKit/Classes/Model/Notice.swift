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
public struct Notice {
    
    /// The name of the library
    public var name: String
    /// The library URL. Usually a GitHub URL but in some cases another URL is more useful (like a library website URL)
    public var url: String
    /// The copyright (usually in format "Copyright (c) [YEAR] [NAME]")
    public var copyright: String
    /// The license of the library. Either use a standard license or create a CustomLicense instance
    public var license: License
    
    public init(name: String, url: String, copyright: String, license: License) {
        self.name = name
        self.url = url
        self.copyright = copyright
        self.license = license
    }
}
