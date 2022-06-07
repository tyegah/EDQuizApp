//
//  iOSViewControllerFactory.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 30/05/22.
//

import UIKit
import EDGameEngine

class iOSViewControllerFactory: ViewControllerFactory {
    private let options: [QuestionType<String>:[String]] // String value is array because one question can have multiple options
    init(options: [QuestionType<String>:[String]]) {
        self.options = options
    }
    
    func questionViewController(for question: QuestionType<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
        guard let options = options[question] else {
            fatalError("Couldn't find options for question: \(question)")
        }
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options) { _ in }
        default:
            return UIViewController()
        }
       
    }
    
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController {
        return UIViewController()
    }
}
