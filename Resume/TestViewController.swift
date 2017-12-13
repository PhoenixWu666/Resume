//
//  TestViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/27.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBAction func showWebView(_ sender: Any) {
        if let rootViewController = navigationController?.childViewControllers[0] {
            rootViewController.performSegue(withIdentifier: "showWebView", sender: rootViewController)
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
