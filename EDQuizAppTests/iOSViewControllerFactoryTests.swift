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
    let question = QuestionType.singleAnswer("Q1")
    let options = ["A1", "A2"]
    
    func test_questionViewController_singleAnswer_createsControllerWithQuestion() {
        // 3. Create the SUT
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController().question, "Q1")
    }
    
    // Because the QuestionViewController needs options, we need to check if the options are set correctly
    func test_questionViewController_singleAnswer_createsControllerWithOptions() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        // 1. Define the expectation
        XCTAssertEqual(makeQuestionController().options, options)
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithSingleSelection() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        // 2. call the functionality that we're testing
        let viewController = makeQuestionController()
        _ = viewController.view
        // 1. Define the expectation
        XCTAssertFalse(viewController.tableView.allowsMultipleSelection)
    }
    
    // MARK: Helpers
    func makeSUT() -> iOSViewControllerFactory {
        return iOSViewControllerFactory(options:[question: options])
    }
    
    func makeQuestionController() -> QuestionViewController {
        return makeSUT().questionViewController(for: question, answerCallback: { _ in}) as! QuestionViewController
    }
}
