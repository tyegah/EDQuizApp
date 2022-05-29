//
//  NavigationControllerRouter.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import EDGameEngine
import UIKit

// We decided to creata this question as enum because
// Question should not be responsible for the answer
// and this way it will separate the concern between question and answer
// The hashable comformance is because the Engine requires the Question to be hashable
// Then we can create the question this way : Question.singleAnswer("The question?")
enum Question<T:Hashable>:Hashable {
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
    static func ==(lhs:Question<T>, rhs:Question<T>) -> Bool {
        return false
    }
}

protocol ViewControllerFactory {
    func questionViewController(for question:String, answerCallback:@escaping (String) -> Void) -> UIViewController
}

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
}
