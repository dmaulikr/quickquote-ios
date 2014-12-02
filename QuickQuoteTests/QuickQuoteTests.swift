//
//  QuickQuoteTests.swift
//  QuickQuoteTests
//
//  Created by Bruce Mcleod on 17/11/2014.
//  Copyright (c) 2014 Bruce Mcleod. All rights reserved.
//

import UIKit
import XCTest


class QuickQuoteTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var expected = 35.74;
        var result = getCarQuote(13, gender: "Male", state: "New South Wales", make: "BMW", year: 2004);
        XCTAssertEqual(result, expected, "car quote did not match expected value.");
    }

    func getCarQuote(age: Int, gender: String, state: String, make: String, year: Int) -> Double{
        var quote = CarQuote(age: age, gender: gender, state: state, make: make, year: year);
        return CarPremiumCalculator().getPremiumForQuote(quote);
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            var expected = 35.74;
            var result = self.getCarQuote(13, gender: "Male", state: "New South Wales", make: "BMW", year: 2004);
        }
    }
    
}
