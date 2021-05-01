//
//  QuizCell.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
//var answerALbl = ""
//var answerBLbl = ""
//var answerCLbl = ""
var submittedAns: [String] = []
import AVFoundation
var pausedCounters = [Double]()

class QuizCell: UITableViewCell {

    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    var buttonSoundEffect: AVAudioPlayer?
    @IBOutlet weak var questionTimer: UILabel!
    @IBOutlet weak var startTimer: UIButton!
    @IBOutlet weak var pauseTimer: UIButton!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answerALbl: UILabel!
    @IBOutlet weak var answerBLbl: UILabel!
    @IBOutlet weak var answerCLbl: UILabel!
    @IBOutlet weak var radioA: UIButton!
    @IBOutlet weak var radioB: UIButton!
    @IBOutlet weak var radioC: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
            submittedAns.append(answerALbl.text ?? "")
            selectedAnswer = answerALbl.text ?? ""
            let path = Bundle.main.path(forResource: "Button-soundEffect.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                buttonSoundEffect = try AVAudioPlayer(contentsOf: url)
                buttonSoundEffect?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    @IBAction func pauseButton(_ sender: Any) {
        if selectedQuiz.questions.count == pauseTimerCard{
            pauseTimerCard = Int()
        }
        pauseTimer.isEnabled = false
        if counter > Double(59){
            var seconds = counter*60
            pausedCounters.append(seconds)
        }else{
            pausedCounters.append(counter)
        }
        isTimerRunning = false
        timer.invalidate()
        print("⏰⏰", selectedQuiz.questions[pauseTimerCard].time, "⏰⏰")
       
    }
    @IBAction func startTimerBtn(_ sender: Any) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            startTimer.isEnabled = false
        }
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
     
        questionTimer.text = "\(minuteString):\(secondString)"
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
            submittedAns.append(answerBLbl.text ?? "")
            selectedAnswer = answerBLbl.text ?? ""
            let path = Bundle.main.path(forResource: "Button-soundEffect.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                buttonSoundEffect = try AVAudioPlayer(contentsOf: url)
                buttonSoundEffect?.play()
            } catch {
                // couldn't load file :(
            }
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
            submittedAns.append(answerCLbl.text ?? "")
            selectedAnswer = answerCLbl.text ?? ""
            let path = Bundle.main.path(forResource: "Button-soundEffect.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                buttonSoundEffect = try AVAudioPlayer(contentsOf: url)
                buttonSoundEffect?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
