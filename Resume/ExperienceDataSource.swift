//
//  ExperienceDataSource.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/25.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import Foundation

class ExperienceDataSource {
    
    init() {
        for bean in experiences {
            if let contentList = jobContents[bean.companyTitle!] {
                bean.contents = contentList
            }
        }
    }
    
    let experiences = [
        ExperienceDataBean(companyTitle: "xxx科技", startDate: "2020/10", endDate: "2020/09"),
        ExperienceDataBean(companyTitle: "xxx資訊", startDate: "2020/09", endDate: "2020/10"),
        ExperienceDataBean(companyTitle: "yyy科技", startDate: "2020/05", endDate: "2020/04"),
        ExperienceDataBean(companyTitle: "yyy資訊", startDate: "2020/09", endDate: "2020/04"),
        ExperienceDataBean(companyTitle: "xxx電腦", startDate: "2020/09", endDate: "2020/03")
    ]
    
    let jobContents = [
        "xxx科技":[
            "伺服器應用程式開發",
            "平板應用程式開發"
        ],
        "xxx資訊":[
            "Qoo 裝置程式開發",
            "和主機通信，進行庫存調整",
            "錄製語音備忘"
        ],
        "yyy科技":[
            "UI 元件客製",
            "產品測試系統維護"
        ],
        "yyy資訊":[
            "系統功能開發"
        ],
        "xxx電腦":[
            "產品展示與教學",
            "客戶電話諮詢服務",
            "在客戶現場進行系統安裝及維護"
        ]
    ]
    
}
