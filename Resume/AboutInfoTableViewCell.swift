//
//  AboutInfoTableViewCell.swift
//  Resume
//
//  Created by Phoenix Wu on H29/10/05.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit

class AboutInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
