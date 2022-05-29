//
//  QuestionTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import XCTest
@testable import EDQuizApp

class QuestionTests: XCTestCase {
    // Hashvalue tests
    func test_hashValue_singleAnswer_returnsTypeHash() {
        let type = "a string"
        let sut = Question.singleAnswer(type)
        XCTAssertEqual(sut.hashValue, type.hashValue)
    }
    
    func test_hashValue_multipleAnswer_returnsTypeHash() {
        let type = "a string"
        let sut = Question.multipleAnswer(type)
        XCTAssertEqual(sut.hashValue, type.hashValue)
    }

    // Equatable tests
    func test_equal_singleAnswer_isEqual() {
        XCTAssertEqual(Question.singleAnswer("a string"), Question.singleAnswer("a string"))
    }
}
