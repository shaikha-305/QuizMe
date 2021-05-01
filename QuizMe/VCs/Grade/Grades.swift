//
//  Grades.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit

class Grades: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var submittedQuiz: Quiz!
    var answers: [String]!
    var correctAns: [Int]! = []
    var finalGrade: String!
    var quizAttempts: Int!
    var allGrades: Int!
    var cardIndex: Int!
    var counter = Int()
    var index = Int()
    var qs = [Question]()
    var questionAttempts = Double()
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        counter = 0
       
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        index = 0
        let unique = Array(Set(answers))
        print(unique)
        tableView.delegate = self
        tableView.dataSource = self
        average.text = String(allGrades/quizAttempts)
        grade.text = finalGrade
        attempts.text = String(quizAttempts)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let unique = Array(Set(answers))
        return unique.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell") as! AnswersCell
        cell.counter = indexPath.row
        cell.qs = qs
        cell.initialize()
        let questionTime = pausedCounters[counter]
        qs[counter].time = questionTime
        print("counter: \(counter)")
        let unique = Array(Set(answers))
//        print("correctAns[counter]: \(correctAns[index])")
        if correctAnswers.isEmpty{
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "check")
        }else if correctAnswers[cell.counter] == 0{
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "check")
        }else{
            print(indexPath.row)
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "cancel-mark")
        }
        
        if totalP>60.0{
            let average = qs[indexPath.row].time/Double(qs[indexPath.row].questionAttempts)
            let minutes = average/60
            let minutesString = "\(minutes)"
            cell.questionAverage.text = "\(minutes) min"
        }else{
            let average = qs[indexPath.row].time/Double(qs[indexPath.row].questionAttempts)
            print(average)
            let averageString = "\(average)"
            print(averageString)
            cell.questionAverage.text = "\(averageString) sec"
        }
        return cell
    }
    @IBAction func done(_ sender: Any) {
        answers = [String]()
        correctAns = [Int]()
        pausedCounters = [Double]()
        counter = 0
        performSegue(withIdentifier: "yay", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "yay"{
////            submittedQuiz.attempts = quizAttempts
//            let vc = segue.destination as! AllQuizzes
////            vc.attempts = quizAttempts
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
