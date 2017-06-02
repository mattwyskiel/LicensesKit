//
//  LicensesViewController.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 8/15/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import UIKit

public class LicensesViewController: UIViewController {
    
    var notices: [Notice] = []
    
    var noticeViews: [NoticeView] {
        return NoticeViewBuilder(notices: notices).render()
    }
    
    public init(notices: [Notice]) {
        self.notices = notices
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(noticesFrom jsonData: Data) {
        if let json = try? JSONSerialization.jsonObject(with: jsonData) as? [[String: String]] {
            self.notices = NoticeViewBuilder.notices(from: json!)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        view.backgroundColor = .white
    }
    
    var showFullLicenseText = false
    
    func configureView() {
        let stackView = UIStackView(arrangedSubviews: noticeViews)
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        
        let scrollView = UIScrollView(frame: .zero)
        scrollView.addSubview(stackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        if navigationController?.navigationBar != nil {
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.bounds.height).isActive = true
        } else {
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
