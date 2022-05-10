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
        let sut = ResultViewController(summary: "a summary", answers:[])
        _ = sut.view
        XCTAssertEqual(sut.headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
        let sut = ResultViewController(summary: "a summary", answers:[])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
}
