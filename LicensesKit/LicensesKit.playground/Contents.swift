//: Playground - noun: a place where people can play

import UIKit
@testable import LicensesKit
var str = "Hello, playground"

let jsonURL = Bundle.main.url(forResource: "Notices", withExtension: "json")!
let jsonData = try! Data(contentsOf: jsonURL)

let licensesViewController = LicensesViewController(noticesFrom: jsonData)
licensesViewController.notices
let notice = licensesViewController.notices[0]

import PlaygroundSupport
PlaygroundPage.current.liveView = licensesViewController
