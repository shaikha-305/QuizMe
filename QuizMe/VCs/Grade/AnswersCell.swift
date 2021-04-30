//
//  AnswersCell.swift
//  QuizMe
//
//  Created by shaikha aljenaidel on 30/04/2021.
//

import UIKit

class AnswersCell: UITableViewCell {

    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var yourAnswer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
