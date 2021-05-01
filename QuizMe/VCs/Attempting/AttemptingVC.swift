//
//  AttemptingVC.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
import AVFoundation

var cardIndex: Int!
var selectedAnswer = ""
var selectedQuiz: Quiz! = Quiz(name: String(), questions: [Question]())
var pauseTimerCard = Int()

class AttemptingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var quizTimer: UILabel!
    var currentQ: Question!
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    var correctAns: [Int]! = []
    var finalGrade: String!
    var allGrades: Int!
    var randomQ: [Question]!
    var questionAttempts = Double()
    
    @IBOutlet weak var tableView: UITableView!

   
    override func viewDidLoad() {
        let randomQ = selectedQuiz.questions.shuffled()
        self.randomQ = randomQ
        cardIndex = nil
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @objc func runTimer(){
        counter += 0.1
        
        let flooredCounter = Int(floor(counter))
        let minute = (flooredCounter % 3600)/60
        var minuteString = "\(minute)"
        if minute < 10{
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600)%60
        var secondString = "\(second)"
        if second < 10{
            secondString = "0\(second)"
        }
     
        quizTimer.text = "\(minuteString):\(secondString)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomQ.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
        currentQ = randomQ[indexPath.row]
        print("⚡️⚡️⚡️⚡️⚡️⚡️⚡️")
        print(currentQ)
        let shuffledAns = currentQ.answers.shuffled()
        print(shuffledAns)
        cell.questionLbl.text = currentQ.question
        cell.answerALbl.text = shuffledAns[0]
        cell.answerBLbl.text = shuffledAns[1]
        cell.answerCLbl.text = shuffledAns[2]
        return cell
    }
   
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
        }
    }

    
    @IBAction func submit(_ sender: Any) {
        if cardIndex == nil{
            cardIndex = 0
            randomQ[cardIndex].questionAttempts += 1
            questionAttempts = Double(randomQ[cardIndex].questionAttempts)
        }else{
            cardIndex! += 1
            randomQ[cardIndex].questionAttempts += 1
            questionAttempts = Double(randomQ[cardIndex].questionAttempts)
        }
        var currentQ = randomQ[cardIndex!]
        if selectedAnswer == currentQ.correctAnswer{
            selectedQuiz.grades += 1
            selectedQuiz.allGrades += 1
            correctAns.append(0)
            
        }else{
            correctAns.append(1)
        }
        print(currentQ.question)
        print("⚡️\(currentQ.correctAnswer)", "⚡️\(selectedAnswer)", correctAns, "⚡️⚡️")
    }
    
    @IBAction func submitQuiz(_ sender: Any) {
        finalGrade = "\(selectedQuiz.grades)/\(selectedQuiz.questions.count)"
        selectedQuiz.attempts += 1
        performSegue(withIdentifier: "grades", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "grades"{
            let vc = segue.destination as! Grades
            vc.answers = submittedAns
            vc.correctAns = correctAns
            vc.finalGrade = finalGrade
            vc.quizAttempts = selectedQuiz.attempts
            vc.allGrades = selectedQuiz.allGrades
            vc.cardIndex = cardIndex
            vc.questionAttempts = questionAttempts
            vc.qs = randomQ
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
