//
//  Notice.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class Notice: NSObject {
    
    var name: String
    var url: String
    var copyright: String
    var license: License?
    
    public init(name: String, url: String, copyright: String, license: License) {
        self.name = name
        self.url = url
        self.copyright = copyright
        self.license = license
    }
   
}
