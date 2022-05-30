//
//  NavigationControllerRouter.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import EDGameEngine
import UIKit


// Factory is made abstract to avoid source code dependency
// This could be created without abstract but it is better with abstract
protocol ViewControllerFactory {
    // We change the question from string to Question enum to make the responsibility of deciding which controller to create falls in the factory implementation
    func questionViewController(for question:QuestionType<String>, answerCallback:@escaping (String) -> Void) -> UIViewController
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController
}

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: QuestionType<String>, answerCallback: @escaping (String) -> Void) {
        show(factory.questionViewController(for: question, answerCallback: answerCallback))
    }
    
    func routeTo(result: Result<QuestionType<String>, String>) {
        show(factory.resultsViewController(for: result))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
