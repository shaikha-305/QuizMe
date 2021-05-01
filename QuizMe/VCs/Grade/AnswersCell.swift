//
//  AnswersCell.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit
var totalP: Double!
class AnswersCell: UITableViewCell {

    var counter: Int!
    var qs: [Question]!
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var questionAverage: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func initialize(){
        var total = pausedCounters.reduce(qs[counter].totalTime, +)
        totalP = total
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
