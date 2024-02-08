//
//  NYCHighSchoolsUITestsLaunchTests.swift
//  NYCHighSchoolsUITests
//
//  Created by Venkata on 2/8/24.
//

import XCTest

final class NYCHighSchoolsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstCell = app.tables.cells.firstMatch
        if firstCell.waitForExistence(timeout: 5) {
            firstCell.tap()
        } else {
            XCTFail("The school list is not loading")
        }

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
