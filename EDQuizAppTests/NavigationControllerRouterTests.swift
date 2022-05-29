//
//  NavigationControllerRouterTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import XCTest
import UIKit

@testable import EDQuizApp

class NavigationControllerRouterTests:XCTestCase {
    // This routeTo method will involve a navigation controller
    // So the expected result will be to check on the NavigationController's vc count
//    func test_routeToQuestion_presentsQuestionController() {
//        // 3. Setup the required classes (like DI classes) and the SUT
//        // first, we need the navigation controller
//        let navigationController = UINavigationController()
//        // second, we need the SUT, which is a class that's not created yet but will be created at this point
//        let sut = NavigationControllerRouter(navigationController)
//        // 2. Call the functionality that we're testing
//        // Because we're testing the router's function "routeTo(question:)" as described in the test name
//        // SO, we're calling that function
//        sut.routeTo(question: "Q1", answerCallback: { _ in })
//        // 1. determine the expected result
//        XCTAssertEqual(navigationController.viewControllers.count, 1)
//    } // because we created the test test_routeToQuestion_presentsCorrectQuestionController(), we don't need the 1st and 2nd test no more
    
//    func test_routeToQuestionTwice_presentsQuestionController() {
//        // 3. Setup the required classes (like DI classes) and the SUT
//        // first, we need the navigation controller
//        let navigationController = UINavigationController()
//        // second, we need the SUT, which is a class that's not created yet but will be created at this point
//        let sut = NavigationControllerRouter(navigationController)
//        // 2. Call the functionality that we're testing
//        sut.routeTo(question: "Q1", answerCallback: { _ in })
//        sut.routeTo(question: "Q2", answerCallback: { _ in })
//        // 1. determine the expected result
//        XCTAssertEqual(navigationController.viewControllers.count, 2)
//    }
    
    // Here we need to check if we load the viewcontroller twice, we will get the right instance of viewcontroller
    // Because of this, we need to decide whether the router should know about the viewcontrollers inside the navigationcontroller or not
    // If not, then we create an abstract factory to be injected inside the router
    // And use a stub of the factory to check on the viewcontroller assertion
    func test_routeToQuestion_presentsCorrectQuestionController() {
        // 3. Setup the required classes (like DI classes) and the SUT
        // first, we need the navigation controller
        let navigationController = UINavigationController()
        // we also need to create the stub of the factory because it is now a requirement to create the SUT
        let viewControllerFactoryStub = ViewControllerFactoryStub()
        // we stub the viewcontroller into the factory
        let viewController = UIViewController()
        viewControllerFactoryStub.stub(question: "Q1", with: viewController)
        // then, we need the SUT, which is a class that's not created yet but will be created at this point
        let sut = NavigationControllerRouter(navigationController, factory: viewControllerFactoryStub)
        // 2. Call the functionality that we're testing
        sut.routeTo(question: "Q1", answerCallback: { _ in })
        // 1. determine the expected result
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToSecondQuestion_presentsCorrectQuestionController() {
        // 3. Setup the required classes (like DI classes) and the SUT
        // first, we need the navigation controller
        let navigationController = UINavigationController()
        // we also need to create the stub of the factory because it is now a requirement to create the SUT
        let viewControllerFactoryStub = ViewControllerFactoryStub()
        // we stub the viewcontrollers into the factory
        let viewController = UIViewController()
        viewControllerFactoryStub.stub(question: "Q1", with: viewController)
        let secondViewController = UIViewController()
        viewControllerFactoryStub.stub(question: "Q2", with: secondViewController)
        // then, we need the SUT, which is a class that's not created yet but will be created at this point
        let sut = NavigationControllerRouter(navigationController, factory: viewControllerFactoryStub)
        // 2. Call the functionality that we're testing
        sut.routeTo(question: "Q1", answerCallback: { _ in })
        sut.routeTo(question: "Q2", answerCallback: { _ in })
        // 1. determine the expected result
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    class ViewControllerFactoryStub: ViewControllerFactory {
        // We hold the value of the stubbed viewcontrollers here
        private var stubbedQuestions = [String:UIViewController]()
        
        // Here we create a stub function to insert the viewcontroller
        func stub(question:String, with viewController: UIViewController) {
            stubbedQuestions[question] = viewController
        }
        
        func questionViewController(for question: String, answerCallback: @escaping (String) -> Void) -> UIViewController {
            return stubbedQuestions[question]!
        }
    }
}
