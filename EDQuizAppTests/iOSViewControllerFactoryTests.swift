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
        let sut = iOSViewControllerFactory()
        
        // 2. call the functionality that we're testing
        let viewController = sut.questionViewController(for: QuestionType.singleAnswer("Q1"), answerCallback: { _ in}) as? QuestionViewController
        // 1. Define the expectation
        XCTAssertNotNil(viewController)
    }
}
