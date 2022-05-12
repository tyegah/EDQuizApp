//
//  ResultViewController.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 10/05/22.
//

import Foundation
import UIKit

struct AnswerViewModel {
    let question:String
    let isCorrect:Bool
}

class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
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
        tableView.register(UINib(nibName: "CorrectAnswerCell", bundle: nil), forCellReuseIdentifier: "CorrectAnswerCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            return tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        }
        return WrongAnswerCell()
    }
}
