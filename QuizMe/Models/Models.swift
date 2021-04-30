//
//  Models.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import Foundation

struct Quiz{
    var questions: [Question]
}

struct Question{
    var question: String
    var answers: [String]
    var correctAnswer: String
}
