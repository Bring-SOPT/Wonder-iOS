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
    @IBOutlet var cafeImg: UIImageView!
    
    @IBOutlet var menuTable: UITableView!
    @IBOutlet var infoView: UIView!
    @IBOutlet var menuBtn: UIButton!
    @IBOutlet var infoBtn: UIButton!
    
    @IBOutlet var cafeNameLabel: UILabel!
    @IBOutlet var cafeAddressLabel: UILabel!
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


extension menudetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return boardList.count
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! menuTableViewCell
//        let board = boardList[indexPath.item]
        

//        cell.menuName.text
//        cell.menuPrice.text = "\(gino())원"
//        cell.menuImg.imageFromUrl(gsno(board.boardPhoto), defaultImgPath: "")
//
        
        return cell
    }
    
}

extension menudetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "menuSelectVC") as! menuSelectVC
//        let board = boardList[indexPath.row]
//        nextVC.boardtitle = board.boardTitle
//        nextVC.contents = board.boardContents
//        nextVC.like = board.boardLike
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}


