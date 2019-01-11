//
//  menuSelectVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class menuSelectVC: UIViewController {

    
    var menuNameData: String?
    var menuPriceData: Int = 0
    var menuImgData: String?
    @IBOutlet var menuImg: UIImageView!
    @IBOutlet var menuName: UILabel!
    @IBOutlet var menuPrice: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    var count:Int = 1
    var totalPrice: Int?
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var sizeSelectView: UIView!
    
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var requestField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuImg.layer.cornerRadius = 10
        menuImg.clipsToBounds = true
        
        self.requestField.layer.borderWidth = 1.0
        self.requestField.layer.borderColor = UIColor.darkGray.cgColor
        menuImg.imageFromUrl(gsno(menuImgData), defaultImgPath: "")
        menuName.text = menuNameData
        menuPrice.text = "\(gino(menuPriceData))원"
        countLabel.text = "\(gino(count))"
        totalPrice = menuPriceData
//        menuPrice.text = "\(gino(Price))"
        totalPriceLabel.text = "\(gino(totalPrice))"
//        menuName.text = name
        self.view.addSubview(sizeSelectView)
    }
    
    @IBAction func sizeSelectAction(_ sender: Any) {
      
        if sizeSelectView.isHidden == true {
        sizeSelectView.isHidden = false
        }
        else  { sizeSelectView.isHidden = true }
        
    }
    
    //장바구니에 담기
    @IBAction func addCartAction(_ sender: Any) {
        
        if count != 0 {
            
            let alert = UIAlertView()
            alert.title = "장바구니에 저장되었습니다."
            alert.message = "뿌잉."
            alert.addButton(withTitle: "ㅇㅋ")
            alert.show()
            
        
            
        }
        
    }
    
    @IBAction func orderNowAction(_ sender: Any) {
        
        if count == 0 {
            
        } else {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "orderVC") as? orderVC else { return }
            dvc.orderPrice = totalPrice
            navigationController?.pushViewController(dvc, animated: true)
        }
        
        
    }
    

    @IBAction func countDownAction(_ sender: Any) {
        
        if count > 1 {
        count = count - 1
        }
        countLabel.text = "\(gino(count))"
        totalPrice = menuPriceData * count
        totalPriceLabel.text = "\(gino(totalPrice))"
        
    }
    
    @IBAction func countupAction(_ sender: Any) {
        
        if count < 10 {
            count = count + 1
        }
        countLabel.text = "\(gino(count))"
        totalPrice = menuPriceData * count
        totalPriceLabel.text = "\(gino(totalPrice))"
        
    }
    
    @IBAction func sizeTallAction(_ sender: Any) {
        sizeLabel.text = "Small"
        sizeSelectView.isHidden = true
        
    }
    
    @IBAction func sizeGrandeAction(_ sender: Any) {
         sizeLabel.text = "Regular"
        sizeSelectView.isHidden = true

 
        
    }
    @IBAction func sizeVentiAction(_ sender: Any) {
         sizeLabel.text = "Large"
        sizeSelectView.isHidden = true
    }
    
    //화면 다른 곳 터치 시 keyboard 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
