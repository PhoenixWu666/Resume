//
//  ExperienceDetailViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/10.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UITableViewController {
    
    var experience: ExperienceDataBean?
    
    var jobItems: [String]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 移除空白列的分隔線
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // bg color of table view
        tableView.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 225/255, alpha: 0.8)
        
        // separator line color
        tableView.separatorColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let experience = experience {
            title = experience.companyTitle!
            jobItems = experience.contents
        }
        
//        // 移除空白列的分隔線
//        tableView.tableFooterView = UIView(frame: CGRect.zero)
//
//        // bg color of table view
//        tableView.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 225/255, alpha: 0.8)
//
//        // separator line color
//        tableView.separatorColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let bean = experience {
            return bean.contents.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let idx = indexPath.row
        
        if let items = jobItems {
            if let myCell = cell as? ExperienceDetailViewCell {
                myCell.jobItem.text = items[idx]
                
                return myCell
            } else {
                cell.textLabel?.text = items[idx]
            }
        }

        return cell
    }

}
