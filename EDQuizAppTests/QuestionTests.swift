//
//  QuestionTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import XCTest
@testable import EDQuizApp

class QuestionTypeTests: XCTestCase {
    // Hashvalue tests
    func test_hashValue_singleAnswer_returnsTypeHash() {
        let type = "a string"
        let sut = QuestionType.singleAnswer(type)
        XCTAssertEqual(sut.hashValue, type.hashValue)
    }
    
    func test_hashValue_multipleAnswer_returnsTypeHash() {
        let type = "a string"
        let sut = QuestionType.multipleAnswer(type)
        XCTAssertEqual(sut.hashValue, type.hashValue)
    }
    
    // Equatable tests
    func test_equalQuestion_isEqual() {
        XCTAssertEqual(QuestionType.singleAnswer("a string"), QuestionType.singleAnswer("a string"))
        XCTAssertEqual(QuestionType.multipleAnswer("a string"), QuestionType.multipleAnswer("a string"))
    }
    
    func test_notEqualQuestion_isNotEqual() {
        XCTAssertNotEqual(QuestionType.singleAnswer("a string"), QuestionType.singleAnswer("another string"))
        XCTAssertNotEqual(QuestionType.multipleAnswer("a string"), QuestionType.multipleAnswer("another string"))
        XCTAssertNotEqual(QuestionType.singleAnswer("a string"), QuestionType.multipleAnswer("another string"))
        XCTAssertNotEqual(QuestionType.singleAnswer("a string"), QuestionType.multipleAnswer("a string"))
    }
}
