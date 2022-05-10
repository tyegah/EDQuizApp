//
//  ResultViewController.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 10/05/22.
//

import Foundation
import UIKit

struct AnswerViewModel {
    let isCorrect:Bool
}

class CorrectAnswerCell: UITableViewCell {
    
}

class WrongAnswerCell: UITableViewCell {
    
}

class ResultViewController:UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    
    private var summary = ""
    private var answers = [AnswerViewModel]()
    convenience init(summary:String, answers:[AnswerViewModel]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = summary
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CorrectAnswerCell()
    }
}
