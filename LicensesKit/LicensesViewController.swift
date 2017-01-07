//
//  LicensesViewController.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 10/1/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit
import WebKit

/// The view controller that displays acknowledgements for an app, with provided `notices` or a `notices.json` file.
public class LicensesViewController: UIViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    
    /// The title for the navigation bar, if this view controller is inside a navigation controller.
    public var navigationTitle: String?
    
    /// An array of `Notice` objects that describe third-party libraries used in an app, to be displayed in this view controller.
    public var notices: [Notice] = []
    
    /// The object used to resolve licenses. Use this instance of the resolver to add custom licenses (`CustomLicense`) to the library's internal license list.
    public private(set) var resolver = LicenseResolver()
    
    private var htmlBuilder = NoticesHtmlBuilder()
    
    /// Set whether the full text of licenses should be shown, or just the summary.
    public var showsFullLicenseText: Bool = false {
        didSet {
            htmlBuilder.showFullLicenseText = self.showsFullLicenseText
        }
    }
    
    /// A string of CSS code to customize the styling of the display of the third-party licenses.
    public var cssStyle: String? {
        didSet {
            htmlBuilder.style = self.cssStyle!;
        }
    }
    
    /// A string of HTML that serves as a "header" for the display of the third-party licenses, shown above the first third-party library info.
    public var pageHeader: String? {
        didSet {
            htmlBuilder.pageHeader = self.pageHeader;
        }
    }
    
    /// A string of HTML that serves as a "footer" for the display of the third-party licenses, shown below the last third-party library info.
    public var pageFooter: String? {
        didSet {
            htmlBuilder.pageFooter = self.pageFooter;
        }
    }
    
    /**
    Add a `Notice` of a third party library for display in this view controller.
    
    - parameter notice: A `Notice` to use for display.
    */
    public func addNotice(notice: Notice) {
        notices.append(notice)
    }
    
    /**
    Add multiple notices of third party libraries for display in this view controller.
    
    - parameter notice: An array of notices to use for display.
    */
    public func addNotices(notices: [Notice]) {
        self.notices += notices
    }
    
    /**
    Add notices for display from a JSON file.
    
    NOTE: Calling this method **replaces** the array of notices with the data found in the JSON file. Add any notices in code after adding the notices from JSON.
    
    - parameter filepath: The file path to the JSON file containing the notices. Use `NSBundle.mainBundle().pathForResource(_:, ofType:)` to programmatically get the path to your file.
    */
    public func setNoticesFromJSONFile(filepath: String) {
        if let jsonData = NSData(contentsOfFile: filepath) {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! [String: [[String: String]]]
                notices = []
                if let noticesArray = jsonArray["notices"] {
                    for noticeJson in noticesArray {
                        let libName = noticeJson["name"]!
                        let libURL = noticeJson["url"]!
                        let copyright = noticeJson["copyright"]!
                        let licenseOptional = self.resolver.licenseForName(name: noticeJson["license"]!)
                        
                        if let license = licenseOptional {
                            notices.append(Notice(name: libName, url: libURL, copyright: copyright, license: license))
                        }
                    }
                }
            } catch {
                
            }
        }
    }
    
    /**
    Loads the view; NOT meant to be called outside of this class.
    */
    override public func loadView() {
        webView = WKWebView()
        
        webView?.navigationDelegate = self
        
        view = webView
    }
    
    /**
    Setup after loading the view; NOT meant to be called outside of this class.
    */
    override public func viewDidLoad() {
        super.viewDidLoad()

        if let title = navigationTitle {
            navigationItem.title = title
        } else {
            navigationItem.title = "Licenses"
        }
    }
    
    /**
    Final setup after view has appeared; NOT meant to be called outside of this class.
    */
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        htmlBuilder.notices = notices
		
        let htmlString = htmlBuilder.build()
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    /**
    Handle memory warnings; NOT meant to be used outside of this class.
    */
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    Handles links clicked in the internal webView; NOT meant to be used outside of this class.
    */
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            let url = navigationAction.request.url
            UIApplication.shared.openURL(url!)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }

}
