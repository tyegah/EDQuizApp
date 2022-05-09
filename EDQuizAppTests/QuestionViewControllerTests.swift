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
        XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
    }
    
    // The next thing to check after applying the header label text
    // is to check for the options for the question
    // In this case, we're checking if the there are zero options
    // it won't show/render anything
    // Because we're gonna show the options in tableview, here we're checking if the number of rows is 0
//    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
//        let sut = makeSUT(options: []) // here we are putting the options as empty array because of the name of the test that describes the options as zero option (empty array)
//        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
//    }
    
    func test_viewDidLoad_rendersOptions() {
       // here we are putting the options as empty array because of the name of the test that describes the options as zero option (empty array)
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]) .tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]) .tableView.numberOfRows(inSection: 0), 2)
    }
    
    // Here we need to check if the tableview will render the options if there is any
    // So we need to setup the tableview datasource on the viewcontroller
    // And at this stage we don't need any layout detail or fancy UITableViewCell
    func test_viewDidLoad_rendersOptionsText() {
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 1), "A2")
    }
    
    // Next, we need to handle when the answer cell is selected
    // It's gonna fire a callback or a delegate as received answer
//    func test_optionSelected_notifiesDelegate() {
//        var receivedAnswer = ""
//        let sut = makeSUT(options: ["A1"]) { receivedAnswer = $0 }
//        sut.tableView.select(row: 0)
//        XCTAssertEqual(receivedAnswer, "A1")
//    }
    
    // Test if there are two options on the tableview
    // The selection changes between the two options, the answer will be the last one selected
    func test_optionSelected_withSingleSelection_notifiesDelegateWithLastSelection() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, ["A2"])
    }
    
    // Test if single selection is enabled, the deselection of the cell will not be called and the callback/delegate is not called with empty selection/array
    func test_optionDeselected_withSingleSelection_doesNotNotifyDelegateWithEmptySelection() {
//        var receivedAnswer = [String]() // we dont need this anymore because we only care about the callback count
        var callbackCount = 0
        let sut = makeSUT(options: ["A1", "A2"]) { _ in
//            receivedAnswer = $0
            callbackCount+=1
        }
        sut.tableView.select(row: 0)
//        XCTAssertEqual(receivedAnswer, ["A1"])
        XCTAssertEqual(callbackCount, 1)
        sut.tableView.deselect(row: 0)
//        XCTAssertEqual(receivedAnswer, ["A1"])
        XCTAssertEqual(callbackCount, 1)
    }
    
    func test_optionSelected_withMultipleSelectionsEnabled_notifiesDelegateSelection() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true
        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, ["A1", "A2"])
    }
    
    
    // Test if deselection on cell will remove received answer
    func test_optionDeselected_withMultipleSelectionsEnabled_notifiesDelegate() {
        var receivedAnswer = [String]()
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true
        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.deselect(row: 0)
        XCTAssertEqual(receivedAnswer, [])
    }

    // MARK: Helpers
    private func makeSUT(question:String = "",
                         options:[String] = [],
selection: @escaping ([String]) -> Void = { _ in }) -> QuestionViewController {
        let sut = QuestionViewController(question: question,
                                         options:options,
                                         selection: selection)
        _ = sut.view
        return sut
    }
}

private extension UITableView {
    func cell(at row:Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row:Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
    
    func select(row:Int) {
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none) // This needs to be called to mimic the row selection on tableview
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
    
    func deselect(row:Int) {
        let indexPath = IndexPath(row: row, section: 0)
        deselectRow(at: indexPath, animated: false) // This needs to be called to mimic the row selection on tableview
        delegate?.tableView?(self, didDeselectRowAt: indexPath)
    }
}
