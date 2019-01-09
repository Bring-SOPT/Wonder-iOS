//
//  historyDetailVC.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit

class historyDetailVC: UIViewController {

    
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var orderListView: UIView!
    
    @IBOutlet var orderNumberLabel: UILabel!
    @IBOutlet var orderDateLabel: UILabel!
    @IBOutlet var orderCafeNameLabel: UILabel!
    
    @IBOutlet var allPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(orderListView)

    }
    
}
