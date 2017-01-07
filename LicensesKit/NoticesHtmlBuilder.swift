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
            _ = noticesHtmlBuilder.append(itemToAppend: header)
        }
        for notice in notices {
            _ = noticesHtmlBuilder.appendNoticeBlock(notice: notice, showFullLicenseText: showFullLicenseText)
        }
        if let footer = pageFooter {
            _ = noticesHtmlBuilder.append(itemToAppend: footer)
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
        _ = append(itemToAppend: "<!DOCTYPE html><html><head>")
        _ = append(itemToAppend: "<style type=\"text/css\">").append(itemToAppend: style).append(itemToAppend: "</style>")
        _ = append(itemToAppend: "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body>")
        return self
    }
    
    func appendNoticeBlock(notice: Notice, showFullLicenseText: Bool) -> Self {
        _ = append(itemToAppend: "<ul><li>").append(itemToAppend: notice.name)
        let currentNoticeURL = notice.url
        if currentNoticeURL.characters.count > 0 {
            _ = append(itemToAppend: " (<a href=\"").append(itemToAppend: currentNoticeURL).append(itemToAppend: "\">").append(itemToAppend: currentNoticeURL).append(itemToAppend: "</a>)")
        }
        _ = append(itemToAppend: "</li></ul>")
        _ = append(itemToAppend: "<pre>")
        _ = append(itemToAppend: notice.copyright).append(itemToAppend: "<br/><br/>")
        _ = append(itemToAppend: getLicenseText(license: notice.license, showFullLicenseText: showFullLicenseText)).append(itemToAppend: "</pre>")
        return self
    }
    
    func appendNoticesContainerEnd() -> StringBuilder {
        _ = append(itemToAppend: "</body></html>")
        return self
    }
    
    private func getLicenseText(license: License!, showFullLicenseText: Bool) -> String {
        if license != nil {
                return showFullLicenseText ? license.fullText : license.summaryText
        }
        return ""
    }
}
