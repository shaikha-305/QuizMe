//
//  Models.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import Foundation

var quizzes: [Quiz] = []
struct Quiz{
    var name: String
    var questions: [Question]
    var attempts = 0
    var allGrades = 0
    var grades = 0
}

struct Question{
    var question: String
    var answers: [String]
    var correctAnswer: String
}
