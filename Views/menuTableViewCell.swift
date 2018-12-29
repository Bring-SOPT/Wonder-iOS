//
//  menuTableViewCell.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    
    @IBOutlet var menuImg: UIImageView!
    @IBOutlet var menuName: UILabel!
    @IBOutlet var menuPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
