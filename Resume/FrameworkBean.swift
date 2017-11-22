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
    
    var topics: [FrameworkTopicItem] = []
    
    init(_ name: String) {
        self.name = name
    }
    
    init(name: String, topics: [FrameworkTopicItem]) {
        self.name = name
        self.topics = topics
    }
    
}
