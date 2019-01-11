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

        let alert = UIAlertView()
        alert.title = "준비중"
        alert.message = "서비스 준비중입니다."
        alert.addButton(withTitle: "확인")
        alert.show()
        
        }
}

