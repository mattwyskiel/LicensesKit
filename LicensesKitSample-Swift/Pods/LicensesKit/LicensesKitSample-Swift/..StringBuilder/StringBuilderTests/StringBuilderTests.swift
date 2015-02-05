//
//  StringBuilderTests.swift
//  StringBuilderTests
//
//  Created by Matthew Wyskiel on 9/30/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import Foundation
import XCTest
import StringBuilder

class StringBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsert() {
        // This is an example of a functional test case.
        let strBuilder = StringBuilder(string: "This  awesome.")
        .insertItem("is", atIndex: 5)
        
        XCTAssert(strBuilder.toString() == "This is awesome.", "The strings are not equal, the string is currently \(strBuilder.toString())")
    }
    
    func testAppend() {
        let strBuilder = StringBuilder(string: "This is ")
        .append("awesome.")
        
        XCTAssert(strBuilder.toString() == "This is awesome.", "The strings are not equal, the string is currently \(strBuilder.toString())")
    }
    
}
