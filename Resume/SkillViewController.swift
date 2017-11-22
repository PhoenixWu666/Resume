//
//  SkillViewController.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/25.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit
import SafariServices

class SkillViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Large title in navigation bar
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationBar.prefersLargeTitles = true
        }
    }

}
