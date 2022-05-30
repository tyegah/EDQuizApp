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
    func test_questionViewController_createsController() {
        // 3. Create the SUT
        let sut = iOSViewControllerFactory(options: [:])
        
        // 2. call the functionality that we're testing
        let viewController = sut.questionViewController(for: QuestionType.singleAnswer("Q1"), answerCallback: { _ in}) as? QuestionViewController
        // 1. Define the expectation
        XCTAssertNotNil(viewController)
    }
    
    // Because the QuestionViewController needs options, we need to check if the options are set correctly
    func test_questionViewController_createsControllerWithOptions() {
        // 3. Create the SUT
        // We need to inject the options data here because the QuestionViewController needs em
        let question = QuestionType.singleAnswer("Q1")
        let options = ["A1", "A2"]
        let sut = iOSViewControllerFactory(options:[question: options])
        // 2. call the functionality that we're testing
        let viewController = sut.questionViewController(for: question, answerCallback: { _ in}) as? QuestionViewController
        // 1. Define the expectation
        XCTAssertEqual(viewController?.options, options)
    }
}
