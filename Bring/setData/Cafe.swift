//
//  Cafe.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//


import Foundation
import UIKit

struct Cafe {
    var cafeImg: UIImage?
    var cafeName: String
    var cafeLatitude: Double
    var cafeLongitude: Double
    

    init(name: String, latitude: Double, longitude: Double, Img: String){
        self.cafeImg = UIImage(named: Img)
        self.cafeName = name
        self.cafeLatitude = latitude
        self.cafeLongitude = longitude
    }
}
