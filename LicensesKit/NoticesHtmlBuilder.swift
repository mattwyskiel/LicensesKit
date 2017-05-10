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
    
    var showFullLicenseText: Bool = false
    
    func build() -> String {
        let noticesHtmlBuilder = StringBuilder()
        _ = noticesHtmlBuilder.appendNoticesContainerStart(style: style)
        if let header = pageHeader {
            _ = noticesHtmlBuilder.append(header)
        }
        for notice in notices {
            _ = noticesHtmlBuilder.appendNoticeBlock(notice: notice, showFullLicenseText: showFullLicenseText)
        }
        if let footer = pageFooter {
            _ = noticesHtmlBuilder.append(footer)
        }
        _ = noticesHtmlBuilder.appendNoticesContainerEnd()
        return noticesHtmlBuilder.toString()
    }
    
    private func writeHTMLFilePath(html: String) -> String {
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
        _ = append("<!DOCTYPE html><html><head>")
        _ = append("<style type=\"text/css\">").append(style).append("</style>")
        _ = append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body>")
        return self
    }
    
    func appendNoticeBlock(notice: Notice, showFullLicenseText: Bool) -> Self {
        _ = append("<ul><li>").append(notice.name)
        let currentNoticeURL = notice.url
        if currentNoticeURL.characters.count > 0 {
            _ = append(" (<a href=\"").append(currentNoticeURL).append("\">").append(currentNoticeURL).append("</a>)")
        }
        _ = append("</li></ul>")
        _ = append("<pre>")
        _ = append(notice.copyright).append("<br/><br/>")
        _ = append(getLicenseText(license: notice.license, showFullLicenseText: showFullLicenseText)).append("</pre>")
        return self
    }
    
    func appendNoticesContainerEnd() -> StringBuilder {
        _ = append("</body></html>")
        return self
    }
    
    private func getLicenseText(license: License!, showFullLicenseText: Bool) -> String {
        if license != nil {
                return showFullLicenseText ? license.fullText : license.summaryText
        }
        return ""
    }
}
