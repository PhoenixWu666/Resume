//
//  NotificationContentViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/12/13.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class NotificationContentViewController: UIViewController {
    
    @IBOutlet weak var contentLbl: UILabel!
    
    var msgContent: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let msgContent = msgContent {
            contentLbl.text = msgContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
