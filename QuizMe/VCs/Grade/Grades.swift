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
        let unique = Array(Set(answers))
        if correctAns[indexPath.row] == 0{
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "check")
        }else{
            cell.yourAnswer.text = unique[indexPath.row]
            cell.answerImage.image = UIImage(named: "cancel-mark")
        }
        return cell
    }
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "yay", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yay"{
//            submittedQuiz.attempts = quizAttempts
            let vc = segue.destination as! AllQuizzes
//            vc.attempts = quizAttempts
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
