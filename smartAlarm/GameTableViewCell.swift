//
//  GameTableViewCell.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/30/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet var scoreCell: UILabel!
    @IBOutlet var nameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
