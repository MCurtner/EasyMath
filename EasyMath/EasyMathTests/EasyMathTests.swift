//
//  EasyMathTests.swift
//  EasyMathTests
//
//  Created by Matthew Curtner on 5/24/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit
import XCTest

class EasyMathTests: XCTestCase {

    let vc = MathVC()
    let subtractionVC = SubtractionViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        self.vc
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConvertNumberToString() {
        XCTAssertEqual(vc.convertNumberToString(23), "23", "Number 23 is converted to String.")
        XCTAssertEqual(vc.convertNumberToString(232323), "232323", "Number 232323 is converted to String.")
    }
    
    func testConvertStringToInt() {
        XCTAssertEqual(vc.convertStringToInt("12"), 12, "String 12 is converted to Int 12")
    }

    func testAdditionMathCheck() {
        XCTAssertEqual(vc.additionMathCheck(2, secondNumber: 3), 5, "2 + 3 = 5")
        XCTAssertNotEqual(vc.additionMathCheck(2, secondNumber: 10), 19, "2 + 10 does not equal 19")
    }
    
    func testSubtractionMathCheck() {
        XCTAssertEqual(subtractionVC.subtractionMathCheck(18, secondNumber: 10), 8, "18 - 10 = 8")
    }
}
