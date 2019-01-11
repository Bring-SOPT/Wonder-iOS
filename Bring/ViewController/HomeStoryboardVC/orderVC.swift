//
//  orderVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class orderVC: UIViewController {

    var storeIdx: Int?
    
    var orderPrice: Int?
    var menuIdx: Int?
    var size: Int?
    var orderCount: String?
    var memo: String?
    
    @IBOutlet var orderPriceLabel: UILabel!
    
    @IBOutlet var finalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderPriceLabel.text = "\(gino(orderPrice))원"
        finalPrice.text = orderPriceLabel.text
    }
    
    @IBAction func paymentAction(_ sender: Any) {
        
        
    }
    

}
