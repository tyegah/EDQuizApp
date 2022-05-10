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
    
    // On testing the tableview it always starts with nothing on the table
    // and then it will gradually add one or two data inside the table and check if the data renders correctly
    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
        let sut = ResultViewController(summary: "a summary", answers:[])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneAnswer_rendersAnswers() {
        let sut = ResultViewController(summary: "a summary", answers:["A1"])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
}
