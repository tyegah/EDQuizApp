//
//  TableViewHelpers.swift
//  EDQuizAppTests
//
//  Created by Ty Septiani on 11/05/22.
//

import UIKit

extension UITableView {
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

