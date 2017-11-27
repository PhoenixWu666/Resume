//
//  SkillRootViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/22.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class SkillRootViewController: UIViewController {
    
    var url: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webViewController = segue.destination as? SkillWebViewController {
            webViewController.urlStr = url
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
