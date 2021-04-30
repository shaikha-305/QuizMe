//
//  QuestionsVC.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
var quiz = Quiz(name: "", questions: [])
class QuestionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var quizNameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
//    DispatchQueue.main.async {
//       self.tableView.reloadData()
//    }
    
    
    @IBAction func addQuestion(_ sender: Any) {
        performSegue(withIdentifier: "questionDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! TableViewCell
        if quiz.questions != nil{
            cell.questionLbl.text = quiz.questions[indexPath.row].question
            cell.correctAnswerLbl.text = quiz.questions[indexPath.row].correctAnswer
            return cell
        }
            return cell
        
    }
    @IBAction func submitButton(_ sender: Any) {
        quiz.name = quizNameField.text ?? "Quiz 1"
        quizzes.append(quiz)
        print(quiz.name, "⚡️")
        performSegue(withIdentifier: "submitted", sender: self)

    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "questionDetails"{
//            let vc = segue.destination as! QuestionDetails
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
