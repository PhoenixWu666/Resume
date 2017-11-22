//
//  ResumeUITests.swift
//  ResumeUITests
//
//  Created by Phoenix Wu on H29/09/03.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import XCTest

class ResumeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTabBar() {
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Phoenix Wu"]/*[[".cells.staticTexts[\"Phoenix Wu\"]",".staticTexts[\"Phoenix Wu\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let app = XCUIApplication()
        app.tabBars.buttons["Experience"].tap()
        
        let experienceTableCells: XCUIElementQuery = app.tables.cells
        let cellCount: Int = experienceTableCells.count
        
        let testCell = experienceTableCells.children(matching: .any).element(boundBy: 0)
        let testCellName = testCell.label
        XCTAssertEqual(testCellName, "悅明達科技")
        XCTAssertEqual(cellCount, 5, "Real count of table cells: [\(cellCount)]")
        
        let notExistItemTxt = "台灣蘋果"
        let notExistCell = experienceTableCells.staticTexts[notExistItemTxt]
        
        XCTAssertFalse(notExistCell.exists, "Cell: \(notExistItemTxt) should not exist")
        
        let itemTxt = "億力資訊"
        let cellItem = experienceTableCells.staticTexts[itemTxt]
        
        XCTAssertTrue(cellItem.exists, "Cell: \(itemTxt) doesn't exist")
        XCTAssertFalse(experienceTableCells.buttons["Delete"].exists, "Delete button should not display before swipe")
        
        
        cellItem.swipeLeft()
        XCTAssertTrue(experienceTableCells.buttons["Delete"].exists, "Delete button should be here after swipe")
        experienceTableCells.buttons["Delete"].tap()
        XCTAssertFalse(cellItem.exists, "Cell: \(itemTxt) should been deleted")
    }
    
}
