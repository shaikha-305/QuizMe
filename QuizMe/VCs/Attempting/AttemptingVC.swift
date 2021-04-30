//
//  AttemptingVC.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit

class AttemptingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentQ: Question!
    var selectedQuiz: Quiz!
   
//    @IBOutlet weak var radioA: UIButton!
//    @IBOutlet weak var radioB: UIButton!
//    @IBOutlet weak var radioC: UIButton!
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var answerALbl: UILabel!
//    @IBOutlet weak var answerBLbl: UILabel!
//    @IBOutlet weak var answerCLbl: UILabel!
   
//    let answerALbl =
    var selectedAnswer = ""
    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedQuiz.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
//        let randomQ = selectedQuiz.questions.randomElement()
        let randomQ = selectedQuiz.questions.shuffled()
        currentQ = randomQ[indexPath.row]
        let shuffledAns = randomQ[indexPath.row].answers.shuffled()
        cell.questionLbl.text = randomQ[indexPath.row].question
        cell.answerALbl.text = shuffledAns[0]
        cell.answerBLbl.text = shuffledAns[1]
        cell.answerCLbl.text = shuffledAns[2]
//        cell.answerALbl.text = answerALbl
//        cell.answerBLbl.text = answerBLbl
//        cell.answerCLbl.text = answerCLbl
//        cell.radioA = radioA
//        cell.radioB = radioB
//        cell.radioC = radioC

        return cell
    }
   

    
    @IBAction func submit(_ sender: Any) {
        if selectedAnswer == currentQ.correctAnswer{
            selectedQuiz.grades += 1
            selectedQuiz.allGrades += 1
        }
    }
    
    @IBAction func submitQuiz(_ sender: Any) {
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
