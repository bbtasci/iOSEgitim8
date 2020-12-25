//
//  LeftMessageCell.swift
//  MyChatBot
//
//  Created by Baris Berkin Tasci on 25.12.2020.
//

import UIKit

class LeftMessageCell: UITableViewCell {
    
    @IBOutlet weak var leftMessageLabel: UILabel!
    
    @IBOutlet weak var leftMessageBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updaLeftMessageCell (by message: MessageData) {
        leftMessageBackgroundView.layer.cornerRadius = 10
        leftMessageBackgroundView.clipsToBounds = true
        leftMessageLabel.text = message.text
        leftMessageLabel.textAlignment = .center
    }
    
}
