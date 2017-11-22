//
//  PGCollectionViewController.swift
//  Resume
//
//  Created by Phoenix Wu on 2017/11/21.
//  Copyright © 2017年 Phoenix Wu. All rights reserved.
//

import UIKit
import SafariServices

class PGCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let pgCellID = "pgCollectionCell"
    
    var pgItems: [ProgrammingLanguageBean] {
        return ProgrammingLanguageDAO().programmingLanguageItems
    }
    
    @IBOutlet weak var pgCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: pgItems[indexPath.row].urlStr) {
            present(SFSafariViewController(url: url), animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = pgCellID
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        let itemIndex = indexPath.row
        
        if let myCell = cell as? ProgrammingLanguageCell {
            let item = pgItems[itemIndex]
            
            myCell.pgName.text = item.name
            myCell.pgIcon.image = UIImage(named: item.imgName)
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
        return pgItems.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pgCollectionView.dataSource = self
        pgCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
