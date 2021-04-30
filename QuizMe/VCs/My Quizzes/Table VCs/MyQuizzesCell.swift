//
//  MyQuizzesCell.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit

class MyQuizzesCell: UITableViewCell {

    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var averageGrades: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
