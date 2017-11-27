//
//  FrameworkBean.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/16.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import Foundation

class FrameworkBean {
    
    var name: String
    
    var url: String
    
    var topics: [FrameworkTopicItem] = []
    
    init(name: String, url: String, topics: [FrameworkTopicItem]) {
        self.name = name
        self.url = url
        self.topics = topics
    }
    
}
