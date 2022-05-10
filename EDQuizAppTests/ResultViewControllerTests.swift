//
//  ResultViewControllerTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 10/05/22.
//

import Foundation
import XCTest
@testable import EDQuizApp

class ResultViewControllerTests:XCTestCase {
    func test_viewDidLoad_rendersSummary() {
        let sut = ResultViewController(summary: "a summary")
        _ = sut.view
        XCTAssertEqual(sut.headerLabel.text, "a summary")
    }
}
