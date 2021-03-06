//
//  AttemptingVC.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
import AVFoundation

var cardIndex = Int()
var selectedAnswer = ""
var selectedQuizz: Quiz! = Quiz(name: String(), questions: [Question]())
var pauseTimerCard = Int()

class AttemptingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedQuiz: Quiz!
    @IBOutlet weak var quizTimer: UILabel!
    var currentQ: Question!
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    var correctAns = [Int]()
    var finalGrade: String!
    var allGrades: Int!
    var randomQ: [Question]!
    @IBOutlet weak var pause: UIButton!
    var questionAttempts = Double()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        //        self.selectedQuiz = selectedQuizz
        let randomQ = selectedQuiz.questions.shuffled()
        self.randomQ = randomQ
        cardIndex = Int()
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            quizTimer.isEnabled = false
        }
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
        cell.cardIndex = indexPath.row
        cell.randomQ = randomQ
        cell.correctAns = correctAns
//        currentQ = randomQ[cardIndex]
        print("??????????????????????????????????????????")
//        print("currentQ:", currentQ,  "cardIndex:", cardIndex)
        let shuffledAns = randomQ[indexPath.row].answers.shuffled()
        print(shuffledAns)
        cell.questionLbl.text = randomQ[indexPath.row].question
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
    
    
    
    @IBAction func submitQuiz(_ sender: Any) {
        finalGrade = "\(selectedQuiz.grades)/\(selectedQuiz.questions.count)"
        selectedQuiz.attempts += 1
        performSegue(withIdentifier: "grades", sender: self)
        if selectedQuizz.questions.count == pauseTimerCard{
                    pauseTimerCard = Int()
                }
                pause.isEnabled = false
                if counter > Double(59){
                    var seconds = counter*60
                    pausedCounters.append(seconds)
                    randomQ[cardIndex].totalTime += seconds
                }else{
                    pausedCounters.append(counter)
                    randomQ[cardIndex].totalTime += counter
                }
                isTimerRunning = false
                timer.invalidate()
        
               totalP = counter
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "grades"{
            let vc = segue.destination as! Grades
            vc.answers = submittedAns
            vc.correctAns = correctAnswers
            vc.finalGrade = finalGrade
            vc.quizAttempts = selectedQuiz.attempts
            vc.allGrades = selectedQuiz.allGrades
//            vc.cardIndex = cardIndex
            vc.questionAttempts = questionAttemptss
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
