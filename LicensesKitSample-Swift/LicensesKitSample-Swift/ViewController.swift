//
//  ViewController.swift
//  LicensesKitSample-Swift
//
//  Created by Matthew Wyskiel on 10/13/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
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

    @IBAction func showLicenses(sender: AnyObject) {
        let licensesViewController = LicensesViewController()
        licensesViewController.setNoticesFromJSONFile(NSBundle.mainBundle().pathForResource("Notices", ofType: "json")!)
        licensesViewController.pageHeader = "<center><h2>Third Party Code Used in this Application </h2></center>"
        licensesViewController.pageFooter = "<center><h3>Feel free to use these libraries in your own projects.</h3></center>"
        let navCont = UINavigationController(rootViewController: licensesViewController)
        licensesViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "closeViewController:")
        presentViewController(navCont, animated: true, completion: nil)
    }
    
    func closeViewController(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

