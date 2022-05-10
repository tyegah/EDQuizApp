//
//  ResultViewController.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 10/05/22.
//

import Foundation
import UIKit

class ResultViewController:UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    private var summary = ""
    convenience init(summary:String, answers:[String]) {
        self.init()
        self.summary = summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }
}
