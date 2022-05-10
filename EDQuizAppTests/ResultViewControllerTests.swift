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
        XCTAssertEqual(makeSUT(summary:"a summary").headerLabel.text, "a summary")
    }
    
    // On testing the tableview it always starts with nothing on the table
    // and then it will gradually add one or two data inside the table and check if the data renders correctly
//    func test_viewDidLoad_withoutAnswers_doesNotRenderAnswers() {
//        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
//    }
//
    
    func test_viewDidLoad_rendersAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    // MARK: Helpers
    
    func makeSUT(summary:String = "", answers:[String] = []) -> ResultViewController {
        let sut = ResultViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    // This is created to prevent the tests breaking when the answer's type is changed
    func makeDummyAnswer() -> String {
        return "an answer"
    }
}
