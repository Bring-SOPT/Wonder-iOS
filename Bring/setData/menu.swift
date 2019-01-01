//
//  menu.swift
//  Bring
//
//  Created by 박소현 on 31/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import Foundation
import UIKit

struct menu {
    var menuImg: UIImage?
    var menuName : String
    var menuPrice : Int
    
    init(name: String, price: Int, Img: String) {
        self.menuImg = UIImage(named : Img)
        self.menuName = name
        self.menuPrice = price
    }
}
