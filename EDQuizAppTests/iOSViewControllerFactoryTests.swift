//
//  iOSViewControllerFactoryTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 30/05/22.
//

import Foundation
import XCTest
@testable import EDQuizApp

class iOSViewControllerFactoryTests:XCTestCase {
    let options = ["A1", "A2"]
    
    func test_questionViewController_singleAnswer_createsControllerWithQuestion() {
        // 3. Create the SUT
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController(question:QuestionType.singleAnswer("Q1")).question, "Q1")
    }
    
    // Because the QuestionViewController needs options, we need to check if the options are set correctly
    func test_questionViewController_singleAnswer_createsControllerWithOptions() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController(question: QuestionType.singleAnswer("Q1")).options, options)
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        let viewController = makeQuestionController(question: QuestionType.singleAnswer("Q1"))
        _ = viewController.view
        // 1. Define the expectation
        XCTAssertFalse(viewController.tableView.allowsMultipleSelection)
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithQuestion() {
        // 3. Create the SUT
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController(question: QuestionType.multipleAnswer("Q1")).question, "Q1")
    }
    
    // Because the QuestionViewController needs options, we need to check if the options are set correctly
    func test_questionViewController_multipleAnswer_createsControllerWithOptions() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController(question: QuestionType.multipleAnswer("Q1")).options, options)
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithMultipleSelection() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        let viewController = makeQuestionController(question: QuestionType.multipleAnswer("Q1"))
        _ = viewController.view
        // 1. Define the expectation
        XCTAssertTrue(viewController.tableView.allowsMultipleSelection)
    }
    
    // MARK: Helpers
    func makeSUT(options: [QuestionType<String>:[String]]) -> iOSViewControllerFactory {
        return iOSViewControllerFactory(options:options)
    }
    
    func makeQuestionController(question: QuestionType<String> = QuestionType.singleAnswer("")) -> QuestionViewController {
        return makeSUT(options: [question: options]).questionViewController(for: question, answerCallback: { _ in}) as! QuestionViewController
    }
}
