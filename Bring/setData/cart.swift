//
//  cart.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import Foundation
import UIKit

struct cart {
    var menuImg: UIImage?
    var menuName: String
    var menuPrice: Int
    var request: String
    
    
    init(name: String, price: Int, request: String, Img: String){
        
        self.menuImg = UIImage(named: Img)
        self.menuName = name
        self.menuPrice = price
        self.request = request
    }
}
