//
//  LicenseResolver.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

/// Resolves the licenses by given name, used publicly to register custom licenses with the library so they could be resolved by name
@objc public class LicenseResolver: NSObject {
    
    var licenses: [String : License] = [:]
    
    func registerDefaultLicenses() {
        licenses = [:]
        registerLicense(license: ApacheSoftwareLicense20())
        registerLicense(license: BSD3ClauseLicense())
        registerLicense(license: ISCLicense())
        registerLicense(license: MITLicense())
        registerLicense(license: GnuLesserGeneralPublicLicense21())
        registerLicense(license: CreativeCommonsAttributionNoDerivs30Unported())
        registerLicense(license: GnuGeneralPublicLicense30())
        registerLicense(license: GnuGeneralPublicLicense20())
    }
    
    /**
    Registers a given license with the library, so that it can be automatically associated with a notice.
    
    - parameter license: A license to register with the library.
    */
    public func registerLicense(license: License) {
        licenses.updateValue(license, forKey: license.name)
    }
    
    override init() {
        super.init()
        registerDefaultLicenses()
    }
    
    func licenseForName(name: String) -> License? {
        return licenses[name]
    }
   
}
