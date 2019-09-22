//
//  DM1Tests.swift
//  DM1Tests
//
//  Created by karen lee on 21/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import XCTest
@testable import DM1

class DM1Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
       /* let app = XCUIApplication()
        
        let numButtons = app.buttons.count
        let numLabels = app.staticTexts.count
        
        XCTAssertEqual(numButtons, 1)
        XCTAssertEqual(numLabels, 10)
        // Test that the initial label text is what you expect
        let string = app.staticTexts.element(matching: .any, identifier: "iching").label
        XCTAssertEqual(string, "62")
        
        XCUIApplication().buttons["Change"].tap()
        sleep(2)
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "iching").label, "72")*/
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
