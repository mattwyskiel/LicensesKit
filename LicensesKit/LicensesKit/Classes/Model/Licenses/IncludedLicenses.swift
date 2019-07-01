//
//  IncludedLicenses.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 6/12/18.
//  Copyright © 2018 Matthew Wyskiel. All rights reserved.
//

import Foundation

/// Apache Software License 2.0
public let ApacheSoftwareLicense20 = License(name: "Apache Software License 2.0", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "asl_20_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "asl_20_full"), version: "2.0", url: URL(string: "http://www.apache.org/licenses/LICENSE-2.0.txt")!)

/// BSD 3-Clause License
public let BSD3ClauseLicense = License(name: "BSD 3-Clause License", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "bsd3_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "bsd3_full"), version: nil, url: URL(string: "http://opensource.org/licenses/BSD-3-Clause")!)

/// BSD 2-Clause License
public let BSD2ClauseLicense = License(name: "BSD 3-Clause License", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "bsd2_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "bsd2_full"), version: nil, url: URL(string: "http://opensource.org/licenses/BSD-3-Clause")!)

/// Creative Commons Attribution-NoDerivs 3.0
public let CreativeCommonsAttributionNoDerivs30Unported = License(name: "Creative Commons Attribution-NoDerivs 3.0 Unported", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "ccand_30_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "ccand_30_full"), version: "3.0", url: URL(string: "http://creativecommons.org/licenses/by-nd/3.0")!)

/// GNU General Public License 2.0
public let GNUGeneralPublicLicense20 = License(name: "GNU General Public License 2.0", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "gpl_20_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "gpl_20_full"), version: "2.0", url: URL(string: "http://www.gnu.org/licenses/")!)

/// GNU General Public License 3.0
public let GNUGeneralPublicLicense30 = License(name: "GNU General Public License 3.0", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "gpl_30_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "gpl_30_full"), version: "3.0", url: URL(string: "http://www.gnu.org/licenses/")!)

/// GNU Lesser General Public License 2.1
public let GNULesserGeneralPublicLicense21 = License(name: "GNU Lesser General Public License 2.1", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "lgpl_21_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "lgpl_21_full"), version: "2.1", url: URL(string: "http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html")!)

/// ISC License
public let ISCLicense = License(name: "ISC License", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "isc_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "isc_full"), version: nil, url: URL(string: "http://opensource.org/licenses/isc-license.txt")!)

/// MIT License
public let MITLicense = License(name: "MIT License", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "mit_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "mit_full"), version: nil, url: URL(string: "http://opensource.org/licenses/MIT")!)

/// Mozilla Public License, Version 2.0
public let MozillaPublicLicense20 = License(name: "Mozilla Public License, Version 2.0", summaryText: LicenseContentFetcher.getContent(fromFileNamed: "mpl_20_summary"), fullText: LicenseContentFetcher.getContent(fromFileNamed: "mpl_20_full"), version: "2.0", url: URL(string: "https://www.mozilla.org/MPL/2.0/")!)
