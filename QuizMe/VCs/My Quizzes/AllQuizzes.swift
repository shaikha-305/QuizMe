//
//  AllQuizzes.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
class AllQuizzes: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var cardIndex = 0

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cardIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! MyQuizzesCell
        if quizzes[indexPath.row].attempts != 0{
            var average = quizzes[indexPath.row].grades/quizzes[indexPath.row].attempts
            cell.averageGrades.text = String(average)
        }
        cell.quizName.text = quizzes[indexPath.row].name
        cell.averageGrades.text = "0"
        cell.attempts.text = String(quizzes[indexPath.row].attempts)
        return cell
    }
    
    @IBAction func viewDetails(_ sender: Any) {
        performSegue(withIdentifier: "quizDetails", sender: cardIndex)
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizDetails"{
            let vc = segue.destination as! QuizDetails
            let index = sender as! Int
            vc.selectedQuiz = quizzes[index]
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
