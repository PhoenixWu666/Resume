//
//  ExperienceDAO.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/25.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import Foundation

class ExperienceDAO {
    
    private var dataSource = ExperienceDataSource()
    
    var experiences: [ExperienceDataBean] {
        
        get {
            return dataSource.experiences
        }
        
    }
    
}
