//
//  NoticeView.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 8/12/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import UIKit

class NoticeView: UICollectionViewCell {
    
    var showFullLicenseText = false
    
    var notice: Notice! {
        didSet {
            setProperties()
        }
    }
    
    var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var libraryNameLabel: UILabel = {
        let libraryNameLabel = UILabel()
        libraryNameLabel.numberOfLines = 0
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
        if #available(iOS 9.0, *) {
            libraryURLLabel.font = .preferredFont(forTextStyle: .subheadline)
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
        licenseView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        licenseView.textColor = UIColor(red: 0.298, green: 0.298, blue: 0.298, alpha: 1)
        licenseView.font = UIFont(name: "Courier", size: 16)
        licenseView.autocapitalizationType = .sentences
        
        return licenseView
    }()
    
    private var cellWidthConstraint: NSLayoutConstraint!
    var width: CGFloat {
        get {
            return cellWidthConstraint.constant
        }
        set {
            cellWidthConstraint.constant = newValue
            cellWidthConstraint.isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        cellWidthConstraint = contentView.widthAnchor.constraint(equalToConstant: 0)
        
        // Assemble View Hierarchy
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(libraryNameLabel)
        stackView.addArrangedSubview(libraryURLLabel)
        stackView.addArrangedSubview(licenseView)
        
        contentView.backgroundColor = .white
        
        setNeedsUpdateConstraints()
    }
    
    private func setProperties() {
        libraryNameLabel.text = notice.name
        libraryURLLabel.text = notice.url.absoluteString
        
        let licenseText: String
        if showFullLicenseText {
            licenseText = notice.license.fullText
        } else {
            if let summary = notice.license.summaryText {
                licenseText = summary
            } else {
                licenseText = notice.license.fullText
            }
        }
        licenseView.text = notice.copyright + "\n\n" + licenseText
    }
    
    private var shouldSetupConstraints = true
    override public func updateConstraints() {
        if shouldSetupConstraints {
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            
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
    
    @objc func didTap(_ sender: AnyObject) {
        
        // Issue here - see GitHub
        //UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
