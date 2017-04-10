//
//  NoticeView.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 8/12/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import UIKit

class NoticeView: UIView {
    
    var showFullLicenseText = false
    
    var notice: Notice!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var libraryNameLabel: UILabel!
    @IBOutlet weak var libraryURLLabel: URLLabel!
    @IBOutlet weak var licenseView: UITextView!
    
    override func awakeFromNib() {
        libraryNameLabel.text = notice.name
        libraryURLLabel.text = notice.url
        
        let licenseText: String
        if showFullLicenseText {
            licenseText = notice.license.fullText
        } else {
            licenseText = notice.license.summaryText
        }
        licenseView.text = notice.copyright + "\n\n" + licenseText
        licenseView.sizeToFit()
        sizeToFit()
    }
    
    class func withNotice(_ notice: Notice) -> NoticeView {
        let view = Bundle(for: NoticeView.self).loadNibNamed("NoticeView", owner: nil, options: nil)?.first as! NoticeView
        view.notice = notice
        return view
    }
}

class URLLabel: UILabel {
    var url: URL {
        return URL(string: text!)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
        addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTap(_ sender: AnyObject) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
