//
//  ChatMessageTableCell.swift
//  SimpleChatApp
//
//  Created by Pushpam Group on 13/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class ChatMessageTableCell: UITableViewCell {

    @IBOutlet var chatMessageTextView: UITextView!
    @IBOutlet var chatOpponentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
               // chatMessageTextView.backgroundColor = UIColor(patternImage: UIImage(named: "chat_bubble")!)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
