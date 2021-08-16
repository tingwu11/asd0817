//
//  ChoiceQues.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import Foundation

struct ChoiceQues {
    let question: String
    let choice: [String]
    let answer: String
    init(question: String, choice: [String], answer: String) {
        self.question = question
        self.choice = choice
        self.answer = answer
    }
}
