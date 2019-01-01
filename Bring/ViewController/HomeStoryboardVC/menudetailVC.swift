//
//  menudetailVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 27..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class menudetailVC: UIViewController {

    
    @IBOutlet var backgroundImg: UIImageView!
    
    @IBOutlet var menuTable: UITableView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var menuBtn: UIButton!
    @IBOutlet var infoBtn: UIButton!
    
    @IBOutlet var cafeNameLabel: UILabel!
    @IBOutlet var cafeAddressLabel: UILabel!
    
    @IBOutlet var openTimeLabel: UILabel!
    @IBOutlet var closeDayLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var cafenameData: String?
    
    var menuList: [menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(infoView)
        dataSetup()
        
        menutableSet()
      

    }
    
    func dataSetup() {
        if let transData = cafenameData {
            cafeNameLabel.text = transData
        }
    }
    
    @IBAction func menuAction(_ sender: UIButton) {
    
        infoView.isHidden = true
        menuTable.isHidden = false
        
        sender.setImage(UIImage(named: "menuButtonClick.png"), for: UIControl.State.normal)
        infoBtn.setImage(UIImage(named: "infoButton.png"), for: UIControl.State.normal)
    }
    
    
    @IBAction func infoAction(_ sender: UIButton) {
        
        infoView.isHidden = false
        menuTable.isHidden = false
        
        sender.setImage(UIImage(named: "infoButtonClick.png"), for: UIControl.State.normal)
        menuBtn.setImage(UIImage(named: "menuButton.png"), for: UIControl.State.normal)
   
    
    }
    
    
    

}




extension menudetailVC {
    
    func menutableSet() {
        let menu0 = menu(name: "아아", price: 5000, Img: "")
        
        menuList = [menu0]
    }
    
}
