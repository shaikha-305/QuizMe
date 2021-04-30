//
//  QuestionDetails.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit

class QuestionDetails: UIViewController {
//    var quiz: Quiz!
    var question: Question! = Question(question: "", answers: [], correctAnswer: "")
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerA: UITextField!
    @IBOutlet weak var answerB: UITextField!
    @IBOutlet weak var answerC: UITextField!
    @IBOutlet weak var radioA: UIButton!
    @IBOutlet weak var radioB: UIButton!
    @IBOutlet weak var radioC: UIButton!
    @IBOutlet weak var submittedQuestion: UILabel!
    @IBOutlet weak var answerALbl: UILabel!
    @IBOutlet weak var answerBLbl: UILabel!
    @IBOutlet weak var answerCLbl: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func radioBtnA(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            radioB.isSelected = false
            radioC.isSelected = false
        }else{
            sender.isSelected = true
            radioB.isSelected = false
            radioC.isSelected = false
            question.correctAnswer = answerA.text ?? "Answer A"
            print(question.correctAnswer, "⚡️✅")
        }
    }
    @IBAction func radioBtnB(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            radioA.isSelected = false
            radioC.isSelected = false
        }else{
            sender.isSelected = true
            radioA.isSelected = false
            radioC.isSelected = false
            question.correctAnswer = answerB.text ?? "Answer B"
            
        }
    }
    @IBAction func radioBtnC(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            radioB.isSelected = false
            radioA.isSelected = false
        }else{
            sender.isSelected = true
            radioB.isSelected = false
            radioA.isSelected = false
            question.correctAnswer = answerC.text ?? "Answer C"

        }
    }
    
    
    
    @IBAction func checkAnswerA(_ sender: Any) {
        question.answers.append(answerA.text ?? "Answer A")
        answerALbl.text = answerA.text
    }
    @IBAction func checkAnswerB(_ sender: Any) {
        question.answers.append(answerB.text ?? "Answer B")
        answerBLbl.text = answerB.text
    }
    @IBAction func checkAnswerC(_ sender: Any) {
        question.answers.append(answerC.text ?? "Answer C")
        answerCLbl.text = answerC.text
    }
    @IBAction func checkQuestion(_ sender: Any) {
        question.question = questionField.text ?? "Question"
        submittedQuestion.text = question.question
    }
    
    
    
    @IBAction func submitQuestion(_ sender: Any) {
        quiz.questions.append(question)
        performSegue(withIdentifier: "back", sender: self)
    }
  
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "back"{
//            let vc = segue.destination as! QuestionsVC
//            vc.quiz = quiz
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
