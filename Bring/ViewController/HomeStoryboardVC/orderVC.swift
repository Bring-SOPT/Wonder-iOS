//
//  orderVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class orderVC: UIViewController {

    var storeIdx: Int?
    
    var orderPrice: Int?
    var menuIdx: Int?
    var size: Int?
//    var orderCount: String?
    var cnt: Int?
    var memo: String?
    
    var paymenu = [Menus]()
    @IBOutlet var orderPriceLabel: UILabel!
    
    @IBOutlet var finalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderPriceLabel.text = "\(gino(orderPrice))원"
        finalPrice.text = orderPriceLabel.text
        

//        var cnt = gsno(orderCount)
        if memo == "요청사항을 입력하세요" {
            memo = ""
        }
        
        paymenu.append(Menus(menuIdx: menuIdx!, size: size!, orderCount: cnt!, memo: memo!, menuTotalPrice: orderPrice!))
        

        
        
    }
    
    @IBAction func paymentAction(_ sender: Any) {
      
        print("버튼을 눌러따....")
        print(paymenu)

        PaymentService.shared.payment(storeIdx: storeIdx!, orderMenuList: paymenu) {
            print("과연....")



        }
                    let alert = UIAlertView()
                    alert.title = "주문완료"
                    alert.message = "주문이 완료되었습니다."
                    alert.addButton(withTitle: "확인")
                    alert.show()
        
      self.dismiss(animated: true)
        

        
    
      
        
    }
    

}
