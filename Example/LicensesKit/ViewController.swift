//
//  ViewController.swift
//  LicensesKit
//
//  Created by mattwyskiel on 04/10/2017.
//  Copyright (c) 2017 mattwyskiel. All rights reserved.
//

import UIKit
import LicensesKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showLicenses(_ sender: Any) {
        let lvc = LicensesViewController(noticesFrom: try! Data(contentsOf: Bundle.main.url(forResource: "Notices", withExtension: "json")!))
        
        let nav = UINavigationController(rootViewController: lvc)
        lvc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close(_:)))
        present(nav, animated: true, completion: nil)
    }
    
    @objc func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

