//
//  QuestionViewController.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 06/05/22.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    private var question:String = ""
    
    convenience init(question:String) {
        self.init()
        self.question = question
    }
}
