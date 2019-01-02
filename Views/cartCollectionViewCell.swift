//
//  cartCollectionViewCell.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit

class cartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cafeNameLabel: UILabel!
    @IBOutlet var maneNameLabel: UILabel!
    @IBOutlet var menuImgView: UIImageView!
    @IBOutlet var requestLabel: UILabel!
    
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var plusBtn: UIButton!
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    

    
    @IBAction func minusAction(_ sender: Any) {
        
    }
    
    @IBAction func plusAction(_ sender: Any) {
    }
    
    
}
