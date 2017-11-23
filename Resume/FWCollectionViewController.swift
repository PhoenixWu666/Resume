//
//  FWCollectionViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/22.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

/**
 Framework collection view controller. In this case, it just display a few data for demo.
 */
class FWCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    /**
     collection view cell ID
     */
    let fwCellID = "fwCollectionCell"
    
    /**
     data source
     */
    var fwItems: [FrameworkBean] {
        return FrameworkBeanDAO().getFWBeanArray()
    }
    
    /**
     collection view. off course, it's a UICollectionView object.
     */
    @IBOutlet weak var fwCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showWebView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = fwCellID
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        let itemIndex = indexPath.row
        
        switch collectionView {
        case fwCollectionView:
            if let myCell = cell as? FrameworkCell {
                initFWCell(cell: myCell, item: fwItems[itemIndex])
            }
            
        default:
            break
        }
        
        return cell
    }
    
    private func initFWCell(cell: FrameworkCell, item: FrameworkBean) {
        guard item.topics.count >= 4 else {
            return
        }
        
        cell.fwName.text = item.name
        cell.fw00Lbl.text = item.topics[0].name
        cell.fw01Lbl.text = item.topics[1].name
        cell.fw02Lbl.text = item.topics[2].name
        cell.fw03Lbl.text = item.topics[3].name
        
        cell.fw00Img.image = UIImage(named: item.topics[0].imgName)
        cell.fw01Img.image = UIImage(named: item.topics[1].imgName)
        cell.fw02Img.image = UIImage(named: item.topics[2].imgName)
        cell.fw03Img.image = UIImage(named: item.topics[3].imgName)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fwItems.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fwCollectionView.dataSource = self
        fwCollectionView.delegate = self
    }
    
    /**
     segue a page that displays web view.
     
     2017-11-23, Phoenix:
     It is not work now. Because when user click the cell, it occurs an exception and makes app crush.
     The exception is from SkillViewController, it's a subclass of UITableViewController. I used
     container view to map this collection view and put it in a cell of SkillVIewController's table
     view, it can display on screen smoothly, but the segue does not work.
     */
    func showWebView() {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "webViewController") {
            present(controller, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
