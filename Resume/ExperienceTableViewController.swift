//
//  ExperienceTableViewController.swift
//  Resume
//
//  Created by Phoenix Wu on H29/09/25.
//  Copyright © 平成29年 Phoenix Wu. All rights reserved.
//

import UIKit

class ExperienceTableViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    var experiences = ExperienceDAO().experiences
    
    // 以動畫顯示 cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 900, 0, 0)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: (3 + Double(1 * indexPath.row)), animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let cellAndIndexTuple = getPreviewCellAndIndex(location: location) {
            if let detailViewController = getDetailViewController(index: cellAndIndexTuple.idxPath) {
                previewingContext.sourceRect = cellAndIndexTuple.cell.frame
                
                return detailViewController
            }
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
    func getDetailViewController(index: IndexPath) -> ExperienceDetailViewController? {
        if let controller =
            storyboard?.instantiateViewController(withIdentifier: "ExperienceDetailViewController") as? ExperienceDetailViewController {
            controller.experience = experiences[index.row]
            
            return controller
        } else {
            return nil
        }
    }
    
    func getPreviewCellAndIndex(location: CGPoint) -> (cell: UITableViewCell, idxPath: IndexPath)? {
        guard let idxPath = tableView.indexPathForRow(at: location) else {
            return nil
        }
        
        guard let cell = tableView.cellForRow(at: idxPath) else {
            return nil
        }
        
        return (cell: cell, idxPath: idxPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExperienceDetail" {
            if let destination = segue.destination as? ExperienceDetailViewController {
                if let currentIdxPath = tableView.indexPathForSelectedRow {
                    destination.experience = experiences[currentIdxPath.row]
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Large title in navigation bar
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
            navigationBar.prefersLargeTitles = true
        }
        
        registerForPreviewing(with: self, sourceView: tableView)

        // 移除空白列的分隔線
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // bg color of table view
        tableView.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 225/255, alpha: 0.8)
        
        // separator line color
        tableView.separatorColor = UIColor(red: 71/255, green: 68/255, blue: 59/255, alpha: 0.4)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = indexPath.row
            
            experiences.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiences.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let bean = experiences[indexPath.row]

        /*
         2017-09-26, Phoenix.
         本來以為可以把 data 傳給 cell，由 cell 自行處理顯示細節。經過實際執行後發現，cell 的顯示必須在這裡指定才行。
         */
        if let myCell = cell as? ExperienceTableCell {           
            myCell.titleLabel.text = bean.companyTitle!
            myCell.dateLabel.text = "\(bean.startDate!) - \(bean.endDate!)"
        } else {
            cell.textLabel?.text = experiences[indexPath.row].companyTitle
        }

        return cell
    }

}
