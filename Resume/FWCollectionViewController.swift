//
//  FWCollectionViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/22.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit

class FWCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let fwCellID = "fwCollectionCell"
    
    var fwItems: [FrameworkBean] {
        return FrameworkBeanDAO().getFWBeanArray()
    }
    
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
