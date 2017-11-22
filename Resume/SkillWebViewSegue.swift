//
//  SkillWebViewSegue.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/21.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class SkillWebViewSegue: UIStoryboardSegue {

    override func perform() {
        if let firstView = source.view, let secondView = destination.view {
            let screenSize = UIScreen.main.bounds.size
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            
            secondView.frame = CGRect(x: screenWidth, y: 0.0, width: screenWidth, height: screenHeight)
            UIApplication.shared.keyWindow?.insertSubview(firstView, aboveSubview: secondView)
            
            source.present(destination, animated: false, completion: nil)
        }
    }
    
}
