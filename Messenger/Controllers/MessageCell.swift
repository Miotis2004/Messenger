//
//  MessageCell.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

