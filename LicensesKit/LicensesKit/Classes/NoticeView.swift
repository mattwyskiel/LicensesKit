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
    
    var notice: Notice
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var libraryNameLabel: UILabel = {
        let libraryNameLabel = UILabel()
        libraryNameLabel.numberOfLines = 0
        libraryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            libraryNameLabel.font = .preferredFont(forTextStyle: .title1)
        } else {
            libraryNameLabel.font = .systemFont(ofSize: 28)
        }
        
        return libraryNameLabel
    }()
    var libraryURLLabel: URLLabel = {
        let libraryURLLabel = URLLabel()
        libraryURLLabel.numberOfLines = 0
        libraryURLLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            libraryURLLabel.font = .preferredFont(forTextStyle: .title3)
        } else {
            libraryURLLabel.font = .systemFont(ofSize: 20)
        }
        
        return libraryURLLabel
    }()
    var licenseView: UITextView = {
        let licenseView = UITextView()
        licenseView.isEditable = false
        licenseView.isScrollEnabled = false
        licenseView.isMultipleTouchEnabled = true
        licenseView.translatesAutoresizingMaskIntoConstraints = false
        licenseView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        licenseView.textColor = UIColor(red: 0.298, green: 0.298, blue: 0.298, alpha: 1)
        licenseView.font = UIFont(name: "Courier", size: 16)
        licenseView.autocapitalizationType = .sentences
        
        return licenseView
    }()
    
    init(notice: Notice) {
        self.notice = notice
        
        super.init(frame: .zero)
        
        // Assemble View Hierarchy
        self.addSubview(libraryNameLabel)
        self.addSubview(libraryURLLabel)
        self.addSubview(licenseView)
        
        setProperties()
        
        backgroundColor = .white
        
        setNeedsUpdateConstraints()
    }
    
    private func setProperties() {
        libraryNameLabel.text = notice.name
        libraryURLLabel.text = notice.url
        
        let licenseText: String
        if showFullLicenseText {
            licenseText = notice.license.fullText
        } else {
            licenseText = notice.license.summaryText
        }
        licenseView.text = notice.copyright + "\n\n" + licenseText
    }
    
    private var shouldSetupConstraints = true
    override func updateConstraints() {
        if shouldSetupConstraints {
            libraryURLLabel.topAnchor.constraint(equalTo: libraryNameLabel.bottomAnchor, constant: 8.0).isActive = true
            licenseView.topAnchor.constraint(equalTo: libraryURLLabel.bottomAnchor, constant: 8.0).isActive = true
            libraryNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            licenseView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(greaterThanOrEqualTo: libraryURLLabel.trailingAnchor).isActive = true
            libraryURLLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            libraryNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: licenseView.trailingAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: licenseView.bottomAnchor).isActive = true
            self.trailingAnchor.constraint(greaterThanOrEqualTo: libraryNameLabel.trailingAnchor).isActive = true
            licenseView.heightAnchor.constraint(equalToConstant: licenseView.contentSize.height).isActive = true
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
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
        
        // Issue here - see GitHub
        //UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
