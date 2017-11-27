//
//  FrameworkBeanDAO.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/16.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import Foundation

class FrameworkBeanDAO {
    
    private var topicItemDictionary = [
        "HealthKit" : [
            FrameworkTopicItem(name: "HKActivitySummary", imgName: "hhw002"),
            FrameworkTopicItem(name: "HKActivitySummaryQuery", imgName: "hhw002"),
            FrameworkTopicItem(name: "HKActivitySummaryType", imgName: "hhw002"),
            FrameworkTopicItem(name: "HKBloodTypeObject", imgName: "hhw002")
        ],
        "SiriKit" : [
            FrameworkTopicItem(name: "INNotebookDomainHandling", imgName: "hhw002"),
            FrameworkTopicItem(name: "INCreateTaskListIntent", imgName: "hhw002"),
            FrameworkTopicItem(name: "INAddTasksIntent", imgName: "hhw002"),
            FrameworkTopicItem(name: "INCreateNoteIntent", imgName: "hhw002")
        ],
        "WatchKit" : [
            FrameworkTopicItem(name: "WKExtension", imgName: "hhw002"),
            FrameworkTopicItem(name: "WKInterfaceDevice", imgName: "hhw002"),
            FrameworkTopicItem(name: "WKAlertAction", imgName: "hhw002"),
            FrameworkTopicItem(name: "WKInterfaceSwitch", imgName: "hhw002")
        ]
    ]
    
    func getFWBeanArray() -> [FrameworkBean] {
        var result = [FrameworkBean]()
        
        if let bean = getFWBean(name: "HealthKit", url: "https://developer.apple.com/documentation/healthkit?changes=latest_major", imgName: "hhw003") {
            result.append(bean)
        }
        
        if let bean = getFWBean(name: "SiriKit", url: "https://developer.apple.com/documentation/sirikit?changes=latest_major", imgName: "hhw003") {
            result.append(bean)
        }
        
        if let bean = getFWBean(name: "WatchKit", url: "https://developer.apple.com/documentation/watchkit?changes=latest_major", imgName: "hhw003") {
            result.append(bean)
        }
        
        return result
    }
    
    private func getFWBean(name: String, url: String, imgName: String) -> FrameworkBean? {
        if let topicItems = topicItemDictionary[name] {
            return FrameworkBean(name: name, url: url, topics: topicItems)
        } else {
            return nil
        }
    }
    
}
