//
//  NavigationControllerRouter.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import EDGameEngine
import UIKit

class NavigationControllerRouter: Router {
    let navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        navigationController.pushViewController(UIViewController(), animated: false)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
}
