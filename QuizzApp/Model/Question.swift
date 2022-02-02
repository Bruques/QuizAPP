//
//  Question.swift
//  QuizzApp
//
//  Created by Bruno Nascimento Marques on 01/02/22.
//

import Foundation

struct Question {
    
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
}
