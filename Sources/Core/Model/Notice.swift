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
public struct Notice: Decodable {
    /// The name of the library
    public var name: String
    /// The library URL. Usually a GitHub URL but in some cases another URL is more useful (like a library website URL)
    public var url: URL
    /// The copyright (usually in format "Copyright (c) [YEAR] [NAME]")
    public var copyright: String
    /// The license of the library.
    public var license: License
    
    enum CodingKeys: String, CodingKey {
        case name, url, copyright, license
    }
    
    public init(name: String, url: URL, copyright: String, license: License) {
        self.name = name
        self.url = url
        self.copyright = copyright
        self.license = license
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        
        let urlString = try container.decode(String.self, forKey: .url)
        guard let nativeURL = URL(string: urlString) else {
            throw DecodingError.typeMismatch(URL.self, DecodingError.Context(codingPath: [CodingKeys.url], debugDescription: "Expected URL String."))
        }
        url = nativeURL
        
        copyright = try container.decode(String.self, forKey: .copyright)
        
        if let licenseName = try? container.decode(String.self, forKey: .license) {
            guard let license = LicenseResolver().license(forName: licenseName) else {
                throw DecodingError.valueNotFound(License.self, DecodingError.Context(codingPath: [CodingKeys.license], debugDescription: "This license must either be provided in full as an object in the JSON file, or registered by using LicenseResolver.register(_:) in code."))
            }
            self.license = license
        } else if let license = try? container.decode(License.self, forKey: .license) {
            self.license = license
        } else {
            throw DecodingError.valueNotFound(License.self, DecodingError.Context(codingPath: [CodingKeys.license], debugDescription: "There must be a license included with this notice."))
        }
        
    }
}
