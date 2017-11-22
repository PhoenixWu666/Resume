//
//  ExperienceTableCellTableViewCell.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/26.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit

class ExperienceTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
