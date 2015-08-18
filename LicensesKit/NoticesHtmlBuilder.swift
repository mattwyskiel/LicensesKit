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
    
    var style: String = "p.license { background:grey;} body { font-family: sans-serif; overflow-wrap: break-word; } pre {background-color: #eeeeee; padding: 1em; white-space: pre-wrap; }"
    var notices: [Notice] = []
    var pageHeader: String?
    var pageFooter: String?
    
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
        if let header = pageHeader {
            noticesHtmlBuilder.append(header)
        }
        for notice in notices {
            noticesHtmlBuilder.appendNoticeBlock(notice: notice, showFullLicenseText: showFullLicenseText)
        }
        if let footer = pageFooter {
            noticesHtmlBuilder.append(footer)
        }
        noticesHtmlBuilder.appendNoticesContainerEnd()
        return noticesHtmlBuilder.toString()
    }
    
    private func writeHTMLFilePath(html: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let cachesDirectory = paths[0] as NSString
        let filePath = cachesDirectory.stringByAppendingPathComponent("licenses.html")
        do {
            try html.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        } catch _ {
        }
        return filePath
    }
    
    
   
}

extension StringBuilder {
    // MARK: Private methods
    func appendNoticesContainerStart(style style: String) -> Self {
        append("<!DOCTYPE html><html><head>")
        append("<style type=\"text/css\">").append(style).append("</style>")
        append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body>")
        return self
    }
    
    func appendNoticeBlock(notice notice: Notice, showFullLicenseText: Bool) -> Self {
        append("<ul><li>").append(notice.name)
        let currentNoticeURL = notice.url
        if currentNoticeURL.characters.count > 0 {
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
