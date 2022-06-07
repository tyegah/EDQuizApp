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
        
        return questionViewController(for: question, options: options, answerCallback: answerCallback)
    }
    
    private func questionViewController(for question: QuestionType<String>, options: [String], answerCallback: @escaping (String) -> Void) -> UIViewController {
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options) { _ in }
        case .multipleAnswer(let value):
            let controller = QuestionViewController(question: value, options: options) { _ in }
            _ = controller.view
            controller.tableView.allowsMultipleSelection = true
            return controller
        }
    }
    
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController {
        return UIViewController()
    }
}
