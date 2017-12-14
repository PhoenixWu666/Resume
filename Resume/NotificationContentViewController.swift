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
    
    @IBOutlet weak var bodyLbl: UILabel!
    
    var notificationContent: NotificationContentData?
    
    var msgContent: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let content = notificationContent {
            contentLbl.text = content.title
            bodyLbl.text = content.body
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
