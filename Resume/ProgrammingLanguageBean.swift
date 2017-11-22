//
//  ProgrammingLanguageBean.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/16.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import Foundation

class ProgrammingLanguageBean {
    
    var name: String
    
    var imgName: String
    
    var urlStr: String
    
    init(name: String, imgName: String, urlStr: String) {
        self.name = name
        self.imgName = imgName
        self.urlStr = urlStr
    }
    
}
