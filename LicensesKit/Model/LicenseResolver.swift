//
//  LicenseResolver.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/11/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit

@objc public class LicenseResolver {
    
    var licenses: [String : License] = [:]
    
    func registerDefaultLicenses() {
        licenses = [:]
        registerLicense(ApacheSoftwareLicense20())
        registerLicense(BSD3ClauseLicense())
        registerLicense(ISCLicense())
        registerLicense(MITLicense())
        registerLicense(GnuLesserGeneralPublicLicense21())
        registerLicense(CreativeCommonsAttributionNoDerivs30Unported())
        registerLicense(GnuGeneralPublicLicense30())
        registerLicense(GnuGeneralPublicLicense20())
    }
    
    public func registerLicense(license: License) {
        licenses.updateValue(license, forKey: license.name)
    }
    
    init() {
        registerDefaultLicenses()
    }
    
    func licenseForName(name: String) -> License? {
        return licenses[name]
    }
   
}
