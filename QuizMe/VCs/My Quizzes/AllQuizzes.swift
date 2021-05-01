//
//  AllQuizzes.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
import AVFoundation
class AllQuizzes: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var buttonSoundEffect: AVAudioPlayer?
    var cardIndex = 0
    var attempts: Int!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
//        self.title = "Quizzes"
//                tableView.delegate = self
//                tableView.dataSource = self
//                // Setup
//                if !UserDefaults().bool(forKey: "setup") {
//                    UserDefaults().set(true, forKey: "setup")
//                    UserDefaults().set(0, forKey: "quiz")
//                }
//
//                // Get all current saved quizzes
//                updateQuizzes()
        // Do any additional setup after loading the view.
    }
    
//    func updateQuizzes(){
//
////           quizzes.removeAll()
//           guard let quiz = UserDefaults().value(forKey: "quiz") as? Quiz else{
//               return
//           }
//
//        for x in 0..<quizzes.count{
//               if let quiz = UserDefaults().value(forKey: "quiz_\(x+1)") as? Quiz {
//                   quizzes.append(quiz)
//               }
//           }
//           tableView.reloadData()
//       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cardIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! MyQuizzesCell
        if quizzes[indexPath.row].attempts != 0{
            var average = quizzes[indexPath.row].grades/quizzes[indexPath.row].attempts
            cell.averageGrades.text = String(average)
        }else{
            cell.averageGrades.text = "0"
        }
        cell.quizName.text = quizzes[indexPath.row].name
        cell.attempts.text = String(quizzes[indexPath.row].attempts)
        return cell
    }
    
    @IBAction func viewDetails(_ sender: Any) {
        performSegue(withIdentifier: "quizDetails", sender: cardIndex)
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        let path = Bundle.main.path(forResource: "Button-soundEffect.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            buttonSoundEffect = try AVAudioPlayer(contentsOf: url)
            buttonSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
        performSegue(withIdentifier: "startQuiz", sender: self)
//        performSegue(withIdentifier: "startQuiz", sender: cardIndex)
//        let index = sender as! Int
        selectedQuizz = quizzes[cardIndex]

    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizDetails"{
            let vc = segue.destination as! QuizDetails
            let index = sender as! Int
            vc.selectedQuiz = quizzes[index]
        }else if segue.identifier == "startQuiz"{
            let vc = segue.destination as! AttemptingVC
            vc.selectedQuiz = quizzes[cardIndex]
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
