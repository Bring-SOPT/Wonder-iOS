//
//  cartVC.swift
//  Bring
//
//  Created by 박소현 on 27/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import AddressBookUI

class cartVC: UIViewController {

    
    @IBOutlet var cartCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cartCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
 
    @IBAction func orderAction(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "home", bundle: nil)

        
        let dvc = storyboard.instantiateViewController(withIdentifier: "orderVC") as? orderVC
                self.present(dvc!,animated: true)
        
        }
}
//
//extension cartVC: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cartList1.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cartCollectionViewCell", for: indexPath) as! cartCollectionViewCell
//        let Detail = cartList1[indexPath.item]
//        cell.cafeNameLabel.text = "뿌링카페"
//        cell.countLabel.text = "\(gino(Detail.orderCount))개)"
//        cell.maneNameLabel.text = Detail.name
//
//        return cell
//
//    }
//
//}
//
//
//
