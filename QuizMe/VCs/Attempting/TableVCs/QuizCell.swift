//
//  QuizCell.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
var answerALbl = ""
var answerBLbl = ""
var answerCLbl = ""

//var radioA: UIButton!
//var radioB: UIButton!
//var radioC: UIButton!

class QuizCell: UITableViewCell {

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
//            selectedAnswer = answerALbl
        }
    }
    @IBAction func radioBtnB(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            radioB.isSelected = false
            radioC.isSelected = false
        }else{
            sender.isSelected = true
            radioB.isSelected = false
            radioC.isSelected = false
//            selectedAnswer = answerALbl
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
//            selectedAnswer = answerCLbl
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
