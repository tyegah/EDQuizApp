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
    let answer:String
    let isCorrect:Bool
}

class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
}

class WrongAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
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
        tableView.register(UINib(nibName: "WrongAnswerCell", bundle: nil), forCellReuseIdentifier: "WrongAnswerCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            return correctAnswerCell(for: answer)
        }
        return tableView.dequeueReusableCell(withIdentifier: "WrongAnswerCell")!
    }
    
    private func correctAnswerCell(for answer:AnswerViewModel) -> CorrectAnswerCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        cell.questionLabel.text = answer.question
        cell.answerLabel.text = answer.answer
        return cell
    }
}
