//
//  ViewControllerFactory.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 30/05/22.
//

import Foundation
import UIKit
import EDGameEngine


// Factory is made abstract to avoid source code dependency
// This could be created without abstract but it is better with abstract
protocol ViewControllerFactory {
    // We change the question from string to Question enum to make the responsibility of deciding which controller to create falls in the factory implementation
    func questionViewController(for question:QuestionType<String>, answerCallback:@escaping (String) -> Void) -> UIViewController
    func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController
}
