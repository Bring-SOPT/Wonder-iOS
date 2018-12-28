//
//  menudetailVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 27..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class menudetailVC: UIViewController {

    @IBOutlet var menuTable: UITableView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var menuBtn: UIButton!
    @IBOutlet var infoBtn: UIButton!
    
    @IBOutlet var cafeNameLabel: UILabel!
    var cafenameData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetup()
    }
    
    func dataSetup() {
        if let transData = cafenameData {
            cafeNameLabel.text = transData
        }
    }
    
    @IBAction func menuAction(_ sender: UIButton) {
        menuTable.isHidden = false
        infoView.isHidden = true
        
        sender.setImage(UIImage(named: "menuButtonClick.png"), for: UIControl.State.normal)
        infoBtn.setImage(UIImage(named: "infoButton.png"), for: UIControl.State.normal)
    }
    
    
    @IBAction func infoAction(_ sender: UIButton) {
        infoView.isHidden = false
        menuTable.isHidden = true
        
        sender.setImage(UIImage(named: "infoButtonClick.png"), for: UIControl.State.normal)
        menuBtn.setImage(UIImage(named: "menuButton.png"), for: UIControl.State.normal)
    }
    
    
    

}
