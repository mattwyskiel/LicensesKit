//
//  LicensesViewController.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 8/15/16.
//  Copyright © 2016 Matthew Wyskiel. All rights reserved.
//

import UIKit

public class LicensesViewController: UICollectionViewController {
    
    var notices: [Notice] = []
    
    let flowLayout = UICollectionViewFlowLayout()
    
    public init(notices: [Notice]) {
        self.notices = notices
        super.init(collectionViewLayout: flowLayout)
    }
    
    public init(noticesFrom jsonData: Data) {
        if let notices = try? JSONDecoder().decode([Notice].self, from: jsonData) {
            self.notices = notices
        }
        super.init(collectionViewLayout: flowLayout)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        view.backgroundColor = .white
        
        collectionView!.register(NoticeView.self, forCellWithReuseIdentifier: "NoticeView")
        flowLayout.estimatedItemSize = CGSize(width: self.collectionView!.frame.width, height: 500)
    }
    
    var showFullLicenseText = false
    
}

extension LicensesViewController { // collection view data source
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notices.count
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let notice = notices[indexPath.item]
        print("notice")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoticeView", for: indexPath)
        print("base cell")
        let noticeView = cell as! NoticeView
        print("cell")
        noticeView.notice = notice
        print("set notice")
        noticeView.width = collectionView.frame.width - 10
        print("set width")
        return noticeView
    }
}
