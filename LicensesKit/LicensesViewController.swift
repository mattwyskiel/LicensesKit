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
        
    }
    
    var showFullLicenseText = false
    
}
