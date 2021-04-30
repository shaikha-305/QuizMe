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

class QuizCell: UITableViewCell {

    var buttonSoundEffect: AVAudioPlayer?
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
