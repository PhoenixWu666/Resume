//
//  SkillWebViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/20.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit
import WebKit

class SkillWebViewController: UIViewController {
    
    var urlStr: String?
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlStr = self.urlStr, let url = URL(string: urlStr) {
            webView.load(URLRequest(url: url))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
