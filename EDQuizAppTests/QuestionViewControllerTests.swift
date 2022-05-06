//
//  QuestionViewControllerTests.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 06/05/22.
//

import Foundation
import XCTest
@testable import EDQuizApp

class QuestionViewControllerTests:XCTestCase {
    // To test viewcontroller, the first to think about is what happens
    // when a view is loaded
    // In this case, when the view did load, we want to render the question header text
    
    // NOTES:
    // We shouldn't invoke the viewDidLoad directly when testing on ViewController
    func test_viewDidLoad_rendersQuestionHeaderText() {
        let sut = QuestionViewController(question: "Q1", options: [])
        _ = sut.view // This invokes the viewDidLoad
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    // The next thing to check after applying the header label text
    // is to check for the options for the question
    // In this case, we're checking if the there are zero options
    // it won't show/render anything
    // Because we're gonna show the options in tableview, here we're checking if the number of rows is 0
    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = QuestionViewController(question: "Q1", options:[])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    // Here we need to check if the tableview will render the options if there is any
    // So we need to setup the tableview datasource on the viewcontroller
    // And at this stage we don't need any layout detail or fancy UITableViewCell
    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = QuestionViewController(question: "Q1", options:["A1"])
        _ = sut.view
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
}
