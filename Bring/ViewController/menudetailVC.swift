//
//  menudetailVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 27..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class menudetailVC: UIViewController {

    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuAction(_ sender: Any) {
        collectionView2.isHidden = true
        collectionView1.isHidden = false
    }
    
    @IBAction func infoAction(_ sender: Any) {
        collectionView1.isHidden = true
        collectionView2.isHidden = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
