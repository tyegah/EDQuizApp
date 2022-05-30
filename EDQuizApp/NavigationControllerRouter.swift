//
//  NavigationControllerRouter.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import EDGameEngine
import UIKit

protocol ViewControllerFactory {
    // We change the question from string to Question enum to make the responsibility of deciding which controller to create falls in the factory implementation
    func questionViewController(for question:Question<String>, answerCallback:@escaping (String) -> Void) -> UIViewController
}

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: Question<String>, answerCallback: @escaping (String) -> Void) {
        let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeTo(result: Result<Question<String>, String>) {
        
    }
}
