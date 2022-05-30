//
//  Question.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 30/05/22.
//

import Foundation

// We decided to creata this question as enum because
// Question should not be responsible for the answer
// and this way it will separate the concern between question and answer
// The hashable comformance is because the Engine requires the Question to be hashable
// Then we can create the question this way : Question.singleAnswer("The question?")
// The type is also generic so we can use any kind of question (e.g: if there are texts or images)
enum QuestionType<T:Hashable>:Hashable {
    case singleAnswer(T)
    case multipleAnswer(T)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .singleAnswer(let value):
            hasher.combine(value)
        case .multipleAnswer(let value):
            hasher.combine(value)
        }
    }
    
    // we need to implement this because of the hashable protocol
    static func ==(lhs:QuestionType<T>, rhs:QuestionType<T>) -> Bool {
        switch (lhs, rhs) {
        case (.singleAnswer(let a), .singleAnswer(let b)):
            return a == b
        case (.multipleAnswer(let a), .multipleAnswer(let b)):
            return a == b
        default:
            return false
        }
    }
}
