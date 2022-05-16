//
//  AnswerViewModel.swift
//  EDQuizApp
//
//  Created by Ty Septiani on 16/05/22.
//

import Foundation

struct AnswerViewModel {
    let question:String
    let answer:String
    let wrongAnswer:String?
    
    // Here isCorrect is no longer needed because we already have the wrongAnswer variable
    // Therefore we can just check if the answer is wrong from the wrongAnswer variable
//    let isCorrect:Bool
}
