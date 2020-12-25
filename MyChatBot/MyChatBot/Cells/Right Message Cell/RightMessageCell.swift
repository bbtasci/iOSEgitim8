//
//  RightMessageCell.swift
//  MyChatBot
//
//  Created by Baris Berkin Tasci on 25.12.2020.
//

import UIKit

final class RightMessageCell: UITableViewCell {
    
    @IBOutlet weak var rightMessageBackgroundView: UIView!
    @IBOutlet weak var rightMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateRightMessageCell (by message: MessageData) {
        rightMessageBackgroundView.layer.cornerRadius = 10
        rightMessageBackgroundView.clipsToBounds = true
        rightMessageLabel.text = message.text
        rightMessageLabel.textAlignment = .center
    }
    
}

