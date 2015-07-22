//
//  LicensesViewController.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/1/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit
import WebKit

public class LicensesViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate {
    
    private var webView: WKWebView!
    
    public var navigationTitle: String?
    public var notices: [Notice] = []
    public var resolver = LicenseResolver()
    
    private var htmlBuilder = NoticesHtmlBuilder()
    
    public var showsFullLicenseText: Bool = false {
        didSet {
            htmlBuilder.showFullLicenseText = self.showsFullLicenseText
        }
    }
    
    public var cssStyle: String? {
        didSet(newValue) {
            htmlBuilder.style = newValue!;
        }
    }
    
    public var pageHeader: String? {
        didSet(newValue) {
            htmlBuilder.pageHeader = newValue;
        }
    }
    
    public var pageFooter: String? {
        didSet(newValue) {
            htmlBuilder.pageFooter = newValue;
        }
    }
    
    public func addNotice(notice: Notice) {
        notices.append(notice)
    }
    
    public func addNotices(notices: [Notice]) {
        self.notices += notices
    }
    
    public func setNoticesFromJSONFile(filepath: String) {
        if let jsonData = NSData(contentsOfFile: filepath) {
            var errorMaybe: NSError?
            let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions(0), error: &errorMaybe) as! [String: [[String: String]]]
            if let error = errorMaybe {
                // error
            } else {
                notices = []
                if let noticesArray = jsonArray["notices"] {
                    for noticeJson in noticesArray {
                        let libName = noticeJson["name"]!
                        let libURL = noticeJson["url"]!
                        let copyright = noticeJson["copyright"]!
                        let licenseOptional = self.resolver.licenseForName(noticeJson["license"]!)
                    
                        if let license = licenseOptional {
                            notices.append(Notice(name: libName, url: libURL, copyright: copyright, license: license))
                        }
                    }
                }
            }
        }
    }

    override public func loadView() {
        webView = WKWebView()
        
        webView?.navigationDelegate = self
        
        view = webView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        if let title = navigationTitle {
            navigationItem.title = title
        } else {
            navigationItem.title = "Licenses"
        }
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        htmlBuilder.addNotices(notices)
        
        let htmlString = htmlBuilder.build()
        webView.loadHTMLString(htmlString, baseURL: nil)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == .LinkClicked {
            let url = request.URL
            UIApplication.sharedApplication().openURL(url!)
        }
        return false
    }
    
    public func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .LinkActivated {
            let url = navigationAction.request.URL
            UIApplication.sharedApplication().openURL(url!)
            decisionHandler(.Cancel)
            return
        }
        decisionHandler(.Allow)
    }

}
