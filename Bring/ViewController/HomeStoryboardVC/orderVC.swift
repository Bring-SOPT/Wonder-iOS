//
//  orderVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class orderVC: UIViewController {

    var orderPrice: Int?
    @IBOutlet var orderPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderPriceLabel.text = "주문금액 : \(gino(orderPrice))원"
    }
    


}
