//
//  DetailBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class DetailBoardVC: UIViewController {

    var img: UIImage?
    var boardtitle: String?
    var name: String?
    var contents: String?
    var time: String?
    var like: Int?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsLabel: UITextView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = boardtitle
        contentsLabel.text = contents
        nameLabel.text = name
        imgView.image = img
        likeLabel.text = "좋아요 \(gino(like))개 "
        

    }
    

   

}
