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
    var qs = [Question]()
    var questionAttempts = Double()
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let unique = Array(Set(answers))
        print(unique)
        tableView.delegate = self
        tableView.dataSource = self
        average.text = String(allGrades/quizAttempts)
        grade.text = finalGrade
        attempts.text = String(quizAttempts)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let unique = Array(Set(answers))
        return unique.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell") as! AnswersCell
        let total = pausedCounters.reduce(qs[counter].totalTime, +)
        let questionTime = pausedCounters[counter]
        qs[counter].time = questionTime
        counter = indexPath.row
        print("counter: \(counter)")
        let unique = Array(Set(answers))
        print("correctAns[counter]: \(correctAns[counter])")
        if correctAns[counter] == Int(){
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "check")
            
        }else if correctAns[counter] == 0{
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "check")
        }else{
            print(indexPath.row)
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "cancel-mark")
        }
        
        if total>60.0{
            let average = qs[counter].time/questionAttempts
            let minutes = average/60
//            var min = String(NSString(format: "%.2f", minutes))
            let minutesString = "\(minutes)"
            cell.questionAverage.text = "\(minutes) min"

        }else{
            let average = qs[counter].time/questionAttempts
            print(average)
//            let minutes = average/60
            let averageString = "\(average)"
            print(averageString)
//            var min = String(NSString(format: "%.2f", averageString))
//            var parts = min.components(separatedBy: ".")
//            var finalAverage = min.split(separator: ".")
//            print(finalAverage)
            cell.questionAverage.text = "\(averageString) sec"
//            print("\(finalAverage[0]) min \(finalAverage[1]) sec")
        }
        return cell
    }
    @IBAction func done(_ sender: Any) {
        answers = [String]()
        correctAns = [Int]()
        pausedCounters = [Double]()
        counter = Int()
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
