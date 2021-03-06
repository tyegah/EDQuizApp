//
//  NavigationControllerRouterTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 29/05/22.
//

import Foundation
import XCTest
import UIKit

@testable import EDGameEngine
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
    
    // REMOVED BECAUSE IT"S COVERED ON THE NEXT TEST
//    func test_routeToQuestion_presentsCorrectQuestionController() {
//        // 3. Setup the required classes (like DI classes) and the SUT
//        // first, we need the navigation controller
//        let navigationController = UINavigationController()
//        // we also need to create the stub of the factory because it is now a requirement to create the SUT
//        let viewControllerFactoryStub = ViewControllerFactoryStub()
//        // we stub the viewcontroller into the factory
//        let viewController = UIViewController()
//        viewControllerFactoryStub.stub(question: "Q1", with: viewController)
//        // then, we need the SUT, which is a class that's not created yet but will be created at this point
//        let sut = NavigationControllerRouter(navigationController, factory: viewControllerFactoryStub)
//        // 2. Call the functionality that we're testing
//        sut.routeTo(question: "Q1", answerCallback: { _ in })
//        // 1. determine the expected result
//        XCTAssertEqual(navigationController.viewControllers.count, 1)
//        XCTAssertEqual(navigationController.viewControllers.first, viewController)
//    }
    
    let navigationController = NonAnimatedNavigationController()
    let factoryStub = ViewControllerFactoryStub()
    lazy var sut: NavigationControllerRouter = {
        return NavigationControllerRouter(self.navigationController, factory: self.factoryStub)
    }()
    
    func test_routeToQuestion_presentsCorrectQuestionController() {
        let viewController = UIViewController()
        factoryStub.stub(question: QuestionType.singleAnswer("Q1"), with: viewController)
        let secondViewController = UIViewController()
        factoryStub.stub(question: QuestionType.singleAnswer("Q2"), with: secondViewController)
        sut.routeTo(question: QuestionType.singleAnswer("Q1"), answerCallback: { _ in })
        sut.routeTo(question: QuestionType.singleAnswer("Q2"), answerCallback: { _ in })
        // 1. determine the expected result
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    // Previously we only tested the question and viewcontroller
    // Here we need to make sure the answercallback is correctly fired
    func test_routeToQuestion_presentsQuestionControllerWithCorrectAnswerCallback() {
        factoryStub.stub(question: QuestionType.singleAnswer("Q1"), with: UIViewController())
        var callbackFired = false
        sut.routeTo(question: QuestionType.singleAnswer("Q1"), answerCallback: { _ in  callbackFired = true})
        factoryStub.answerCallbacks[QuestionType.singleAnswer("Q1")]!("Answer")
        // 1. determine the expected result
        XCTAssertTrue(callbackFired)
    }
    
    func test_routeToResult_presentsCorrectResultController() {
        let viewController = UIViewController()
        let result = Result(answers: [QuestionType.singleAnswer("Q1"):"A1"], score: 10)
        let secondViewController = UIViewController()
        let secondResult = Result(answers: [QuestionType.singleAnswer("Q2"):"A2"], score: 20)
        factoryStub.stub(result: result, with: viewController)
        factoryStub.stub(result: secondResult, with: secondViewController)
        sut.routeTo(result: result)
        sut.routeTo(result: secondResult)
        // 1. determine the expected result
        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    // We need to create a fake nav controller here because on the
    // NavigationControllerRouter, we changed the animated parameter on the pushViewController to be true, and it affects the tests. So, in order to make it not affect the test, we create this class
    
    class NonAnimatedNavigationController: UINavigationController {
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false) // we make the animation false because we only need to the test navigation controller stack in this test class.
        }
    }
    
    class ViewControllerFactoryStub: ViewControllerFactory {
        // We hold the answer callbacks here
        var answerCallbacks = [QuestionType<String>: (String) -> Void]()
        // We hold the value of the stubbed viewcontrollers here
        private var stubbedQuestions = [QuestionType<String>:UIViewController]()
        private var stubbedResults = [Result<QuestionType<String>, String>:UIViewController]()
        
        // Here we create a stub function to insert the viewcontroller
        func stub(question:QuestionType<String>, with viewController: UIViewController) {
            stubbedQuestions[question] = viewController
        }
        
        // Here we create a stub function to insert the viewcontroller
        func stub(result:Result<QuestionType<String>, String>, with viewController: UIViewController) {
            stubbedResults[result] = viewController
        }
        
        func questionViewController(for question: QuestionType<String>, answerCallback: @escaping (String) -> Void) -> UIViewController {
            self.answerCallbacks[question] = answerCallback
            return stubbedQuestions[question] ?? UIViewController()
        }
        
        func resultsViewController(for result: Result<QuestionType<String>, String>) -> UIViewController {
            self.stubbedResults[result] ?? UIViewController()
        }
    }
}


// We use fake hashable here just for the testing purposes
extension Result: Hashable {
//    static func create(answers:[Question:Answer], score:Int) -> Result {
//        return Result(answers: answers, score: score)
//    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(score.hashValue)
    }
    
    public static func ==(lhs:Result, rhs:Result) -> Bool {
        return (lhs.score == rhs.score)
    }
}
