//
//  AboutViewControllViewController.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/15.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("AboutViewController.viewWillDisappear")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let cell = tableCell as? AboutInfoTableViewCell {
            let idx = indexPath.row

            switch idx {
            case 0:
                cell.titleLabel.text = "Name"
                cell.valueLabel.text = "Phoenix Wu"

            case 1:
                cell.titleLabel.text = "Mobile"
                cell.valueLabel.text = "+xxx xxx xxx 993"

            case 2:
                cell.titleLabel.text = "email"
                
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate, appDelegate.isLaunchedByNotification {
                    cell.valueLabel.text = "xxxx@gmail.com"
                    appDelegate.isLaunchedByNotification = false
                } else {
                    cell.valueLabel.text = "❤️ミ❤️ク❤️命❤️@gmail.com"
                }

            default:
                break
            }
            
            return cell
        } else {
            return tableCell
        }
    }

    fileprivate func moveToDetailViewController() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, appDelegate.isLaunchedByNotification {
            if let tabbarController = self.parent as? UITabBarController, let count = tabbarController.viewControllers?.count, count > 0 {
                let lastIdx = tabbarController.viewControllers!.count - 1
                if let destination = appDelegate.getViewControllerFromRootViewController(tabbarController: tabbarController, selectedIndex: lastIdx) as? NotificationContentViewController, let optionContent = appDelegate.optionContent {
                    destination.msgContent = optionContent
                }
                
                appDelegate.moveToOtherVC(rootViewController: tabbarController, selectedIndex: lastIdx)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.backgroundColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
        tableView.separatorColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        moveToDetailViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
