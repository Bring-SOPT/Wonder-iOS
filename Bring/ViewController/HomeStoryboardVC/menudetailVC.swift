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
    var menuList = [Menu]()
    var cafeIdxData: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(infoView)
        dataSetup()
        
//        menutableSet()
      
        menuTable.dataSource = self
        menuTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        StoreService.shared.getMenuList(storeIdx: cafeIdxData!) {
            [weak self] (data) in
            guard let `self` = self else {return}
            guard let menus = data.menuList else { return }
            self.backgroundImg.imageFromUrl(data.storePhoto, defaultImgPath: "")
            self.menuList = menus
            self.menuTable.reloadData()
            
//            self.openTimeLabel.text = data.time
//            self.closeDayLabel.text = data.breakDays
//            self.numberLabel.text = data.number
        }
        
        StoreService.shared.loadStoreDetail(storeIdx: cafeIdxData!) {
            [weak self] (data) in
            guard let `self` = self else {return}
            
            self.openTimeLabel.text = data.time
            self.closeDayLabel.text = data.breakDays
            self.numberLabel.text = data.number
        }
        
        
    }
    
    func dataSetup() {
        if let transData = cafenameData {
            cafeNameLabel.text = transData
        }

    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
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
    
    
    
    @IBAction func cartAction(_ sender: Any) {
        
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "cartVC") as? cartVC else { return }
//
//                navigationController?.pushViewController(dvc, animated: true)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "cart", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "cartVC")
        present(nextView, animated: true)
        
    }
    
    //이거는 왜 오류나지 ;;

}



extension menudetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! menuTableViewCell
        let menu = menuList[indexPath.item]
    
        cell.menuName.text = menu.menuName
        cell.menuPrice.text = "∙\(gino(menu.menuPrice))원"
        cell.menuImg.imageFromUrl(gsno(menu.menuPhoto), defaultImgPath: "")
        
        return cell
    }
    
}

extension menudetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "menuSelectVC") as! menuSelectVC
        let menu = menuList[indexPath.row]
        nextVC.menuNameData = menu.menuName
        nextVC.menuPriceData = menu.menuPrice!
        nextVC.menuImgData = menu.menuPhoto
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}


