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
    
    // Because we want the tableview to render two types of cell,
    // which are the correct answer cell and the wrong answer cell
    // then we need to test whether the cell is correctly rendered for the right answer
    // At this point, the answer is still in the String type
    // So we need to change the answer to be a type of struct (a view model) to be able to determine whether the answer is correct or not (by the isCorrect attribute on the answer struct
    // So we create the answer struct/view model (with just isCorrect as the attribute for now)
    // And we also create the CorrectAnswerCell (just a class is enough)
    func test_viewDidLoad_withCorrectAnswer_rendersCorrectAnswerCell() {
        let sut = makeSUT(answers:[AnswerViewModel(isCorrect: true)])
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
    }
    
    // MARK: Helpers
    
    func makeSUT(summary:String = "", answers:[AnswerViewModel] = []) -> ResultViewController {
        let sut = ResultViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    // This is created to prevent the tests breaking when the answer's type is changed
    func makeDummyAnswer() -> AnswerViewModel {
        return AnswerViewModel(isCorrect: false)
    }
}
