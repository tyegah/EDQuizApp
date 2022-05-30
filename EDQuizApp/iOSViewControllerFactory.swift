//
//  iOSViewControllerFactory.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 30/05/22.
//

import UIKit
import EDGameEngine

class iOSViewControllerFactory: ViewControllerFactory {
    func questionViewController(for question: QuestionType<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
        return QuestionViewController()
    }
    
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController {
        return UIViewController()
    }
}
