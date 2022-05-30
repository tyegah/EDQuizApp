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
        return QuestionViewController(question: "", options: options[question]!) { _ in }
    }
    
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController {
        return UIViewController()
    }
}
