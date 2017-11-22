//
//  ExperienceDataBean.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/25.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import Foundation

/**
 経歴アイテム。
 */
class ExperienceDataBean {
    
    /**
     会社名
     */
    var companyTitle: String?
    
    /**
     入社日
     */
    var startDate: String?
    
    /**
     退社日
     */
    var endDate: String?
    
    /**
     職務内容
     */
    var contents: [String] = []
    
    init(companyTitle: String, startDate: String, endDate: String) {
        self.companyTitle = companyTitle
        self.startDate = startDate
        self.endDate = endDate
    }
    
}
