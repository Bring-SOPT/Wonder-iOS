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
    
    @IBOutlet var finalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderPriceLabel.text = "\(gino(orderPrice))원"
        finalPrice.text = orderPriceLabel.text
    }
    


}
