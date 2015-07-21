//
//  NoticesHtmlBuilder.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit
import StringBuilder

class NoticesHtmlBuilder {
    
    private var licenseTextCache: [License: String] = [:]
    var style: String = "p.license { background:grey;} body { font-family: sans-serif; overflow-wrap: break-word; } pre {background-color: #eeeeee; padding: 1em; white-space: pre-wrap; }"
    var notices: [Notice] = []
    
    func addNotice(notice: Notice) {
        notices.append(notice)
    }
    
    func addNotices(notices: [Notice]) {
        for notice in notices {
            self.notices.append(notice)
        }
    }
    
    var showFullLicenseText: Bool = false
    
    func build() -> String {
        let noticesHtmlBuilder = StringBuilder()
        noticesHtmlBuilder.appendNoticesContainerStart(style: style)
        for notice in notices {
            noticesHtmlBuilder.appendNoticeBlock(notice: notice, showFullLicenseText: showFullLicenseText)
        }
        noticesHtmlBuilder.appendNoticesContainerEnd()
        return noticesHtmlBuilder.toString()
    }
    
    private func writeHTMLFilePath(html: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let cachesDirectory = paths[0] as! String
        let filePath = cachesDirectory.stringByAppendingPathComponent("licenses.html")
        html.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
        return filePath
    }
    
    
   
}

extension StringBuilder {
    // MARK: Private methods
    func appendNoticesContainerStart(#style: String) -> Self {
        append("<!DOCTYPE html><html><head>")
        append("<style type=\"text/css\">").append(style).append("</style>")
        append("</head><body>")
        return self
    }
    
    func appendNoticeBlock(#notice: Notice, showFullLicenseText: Bool) -> Self {
        append("<ul><li>").append(notice.name)
        let currentNoticeURL = notice.url
        if count(currentNoticeURL) > 0 {
            append(" (<a href=\"").append(currentNoticeURL).append("\">").append(currentNoticeURL).append("</a>)")
        }
        append("</li></ul>")
        append("<pre>")
        append(notice.copyright).append("<br/><br/>")
        append(getLicenseText(notice.license, showFullLicenseText: showFullLicenseText)).append("</pre>")
        return self
    }
    
    func appendNoticesContainerEnd() -> StringBuilder {
        append("</body></html>")
        return self
    }
    
    private func getLicenseText(license: License!, showFullLicenseText: Bool) -> String {
        if license != nil {
                return showFullLicenseText ? license.fullText : license.summaryText
        }
        return ""
    }
}
