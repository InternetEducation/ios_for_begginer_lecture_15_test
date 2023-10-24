//
//  TinkoffCalculatorUITests.swift
//  TinkoffCalculatorUITests
//

import XCTest

class TinkoffCalculatorUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func test_lecture15_calculations() {
        let app = XCUIApplication()
        app.launch()

        let durations: [Double] = [1, 2, 3, 5, 8, 13, 21].flatMap({ [$0,$0,$0] })

        var isFailed = true

        for duration in durations {
            let before = XCUIScreen.main.screenshot()
            app.press(forDuration: duration)
            let after = XCUIScreen.main.screenshot()

            isFailed = before.pngRepresentation == after.pngRepresentation

            if !isFailed {
                break
            }
        }

        XCTAssertFalse(isFailed, "Изображение при нажатии на экран не обнаружено")
    }
}
