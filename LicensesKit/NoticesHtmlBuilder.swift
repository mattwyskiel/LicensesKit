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
    
    func addNotice(_ notice: Notice) {
        notices.append(notice)
    }
    
    func addNotices(_ notices: [Notice]) {
        for notice in notices {
            self.notices.append(notice)
        }
    }
    
    var showFullLicenseText: Bool = false
    
    func build() -> String {
        var noticesHtmlBuilder = StringBuilder().appendNoticesContainerStart(style: style)
        if let header = pageHeader {
            noticesHtmlBuilder = noticesHtmlBuilder.append(header)
        }
        for notice in notices {
            noticesHtmlBuilder = noticesHtmlBuilder.appendNoticeBlock(notice: notice, showFullLicenseText: showFullLicenseText)
        }
        if let footer = pageFooter {
            noticesHtmlBuilder = noticesHtmlBuilder.append(footer)
        }
        noticesHtmlBuilder = noticesHtmlBuilder.appendNoticesContainerEnd()
        return noticesHtmlBuilder.toString()
    }
    
    private func writeHTMLFilePath(_ html: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let cachesDirectory = paths[0] as NSString
        let filePath = cachesDirectory.appendingPathComponent("licenses.html")
        do {
            try html.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch _ {
        }
        return filePath
    }
    
    
   
}

extension StringBuilder {
    // MARK: Private methods
    func appendNoticesContainerStart(style: String) -> Self {
        return append("<!DOCTYPE html><html><head>")
        .append("<style type=\"text/css\">").append(style).append("</style>")
        .append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body>")
    }
    
    func appendNoticeBlock(notice: Notice, showFullLicenseText: Bool) -> Self {
        var this = append("<ul><li>").append(notice.name)
        let currentNoticeURL = notice.url
        if currentNoticeURL.characters.count > 0 {
            this = this.append(" (<a href=\"").append(currentNoticeURL).append("\">").append(currentNoticeURL).append("</a>)")
        }
        return this.append("</li></ul>")
        .append("<pre>")
        .append(notice.copyright).append("<br/><br/>")
        .append(getLicenseText(notice.license, showFullLicenseText: showFullLicenseText)).append("</pre>")
        
    }
    
    func appendNoticesContainerEnd() -> StringBuilder {
        return append("</body></html>")
    }
    
    private func getLicenseText(_ license: License!, showFullLicenseText: Bool) -> String {
        if license != nil {
                return showFullLicenseText ? license.fullText : license.summaryText
        }
        return ""
    }
}
