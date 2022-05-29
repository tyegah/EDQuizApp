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
    func test_routeToQuestion_presentQuestionController() {
        // 3. Setup the required classes (like DI classes) and the SUT
        // first, we need the navigation controller
        let navigationController = UINavigationController()
        // second, we need the SUT, which is a class that's not created yet but will be created at this point
        let sut = NavigationControllerRouter(navigationController)
        // 2. Call the functionality that we're testing
        // Because we're testing the router's function "routeTo(question:)" as described in the test name
        // SO, we're calling that function
        sut.routeTo(question: "Q1", answerCallback: { _ in })
        // 1. determine the expected result
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }
}
