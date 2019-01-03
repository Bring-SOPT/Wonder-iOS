//
//  orderListTableViewCell.swift
//  Bring
//
//  Created by 박소현 on 04/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit

class orderListTableViewCell: UITableViewCell {

    
    @IBOutlet var menuNameLabel: UILabel!
    @IBOutlet var menuSizeAndNumberLabel: UILabel!
    @IBOutlet var requestLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
