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
//
    func test_viewDidLoad_rendersAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: [makeAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    // Because we want the tableview to render two types of cell,
    // which are the correct answer cell and the wrong answer cell
    // then we need to test whether the cell is correctly rendered for the right answer
    // At this point, the answer is still in the String type
    // So we need to change the answer to be a type of struct (a view model) to be able to determine whether the answer is correct or not (by the isCorrect attribute on the answer struct
    // So we create the answer struct/view model (with just isCorrect as the attribute for now)
    // And we also create the CorrectAnswerCell (just a class is enough)
//    func test_viewDidLoad_withCorrectAnswer_rendersCorrectAnswerCell() {
//        let sut = makeSUT(answers:[makeAnswer(isCorrect: true)])
//        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
//        XCTAssertNotNil(cell)
//    }
    
    // On correct answer cell, we want to render the question and the answer on it. So, here we are testing if the cell is rendering the question and answer respectively
//    func test_viewDidLoad_withCorrectAnswer_rendersQuestionText() {
//        let sut = makeSUT(answers:[makeAnswer(question: "Q1", isCorrect: true)])
//        let cell = sut.tableView.cell(at: 0) as! CorrectAnswerCell
//        XCTAssertEqual(cell.questionLabel.text, "Q1")
//    }
//
//    func test_viewDidLoad_withCorrectAnswer_rendersAnswerText() {
//        let sut = makeSUT(answers:[makeAnswer(answer: "A1", isCorrect: true)])
//        let cell = sut.tableView.cell(at: 0) as! CorrectAnswerCell
//        XCTAssertEqual(cell.answerLabel.text, "A1")
//    }
    
    // REFACTOR
    // Here we combined the previous 3 tests into one
    func test_viewDidLoad_withCorrectAnswer_configuresCell() {
        let sut = makeSUT(answers:[makeAnswer(question: "Q1", answer: "A1")])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }
    
    // This is already covered in the next test
//    func test_viewDidLoad_withWrongAnswer_rendersWrongAnswerCell() {
//        let sut = makeSUT(answers:[makeAnswer()])
//        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
//        XCTAssertNotNil(cell)
//    }
    
    func test_viewDidLoad_withWrongAnswer_configuresCell() {
        let sut = makeSUT(answers:[makeAnswer(question: "Q1",
                                              answer: "A1",
                                              wrongAnswer: "wrong")])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
        XCTAssertEqual(cell?.wrongAnswerLabel.text, "wrong")
    }
    
    // MARK: Helpers
    
    func makeSUT(summary:String = "", answers:[AnswerViewModel] = []) -> ResultViewController {
        let sut = ResultViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    // This is created to prevent the tests breaking when the answer's type is changed
    // This dummy is no longer needed
//    func makeDummyAnswer() -> AnswerViewModel {
//        return makeAnswer(isCorrect: false)
//    }
    
    func makeAnswer(question:String = "",
                    answer:String = "",
                    wrongAnswer:String? = nil) -> AnswerViewModel {
        return AnswerViewModel(question: question,
                               answer:answer,
                               wrongAnswer:wrongAnswer)
    }
}
