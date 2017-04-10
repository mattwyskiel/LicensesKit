//
//  NoticeViewBuilder.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 8/15/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import Foundation

class NoticeViewBuilder {
    var notices: [Notice]
    init(notices: [Notice]) {
        self.notices = notices
    }
    
    func render() -> [NoticeView] {
        return notices.map { notice in
            return NoticeView.withNotice(notice)
        }
    }
}

extension NoticeViewBuilder {
    class func notices(from json: [[String: String]]) -> [Notice] {
        return json.map { single in
            guard let name = single["name"],
                let url = single["url"],
                let copyright = single["copyright"],
                let licenseName = single["license"] else {
                    fatalError("JSON not formatted correctly")
            }
            guard let license = LicenseResolver.shared.license(forName: licenseName) else {
                fatalError("License specified not registered with the Resolver. Use LicenseResolver.shared.registerLicense(_:)")
            }
            return Notice(name: name, url: url, copyright: copyright, license: license)
        }
    }
}
