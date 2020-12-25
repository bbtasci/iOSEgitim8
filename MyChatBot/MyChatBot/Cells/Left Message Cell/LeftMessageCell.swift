//
//  LeftMessageCell.swift
//  MyChatBot
//
//  Created by Baris Berkin Tasci on 25.12.2020.
//

import UIKit

final class LeftMessageCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var leftMessageLabel: UILabel!
    
    @IBOutlet fileprivate weak var leftMessageBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateLeftMessageCell (by message: MessageData) {
        leftMessageBackgroundView.layer.cornerRadius = 10
        leftMessageBackgroundView.clipsToBounds = true
        leftMessageLabel.text = message.text
    }
    
}
