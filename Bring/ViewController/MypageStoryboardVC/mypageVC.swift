//
//  mypageVC.swift
//  Bring
//
//  Created by 박소현 on 28/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class mypageVC: UIViewController {

    var loginOk:Int = 0
//    로그인 된 상태면 1, 안된 상태면 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheck()
    }
    
    func loginCheck() {
//        self.performSegue(withIdentifier: "naviSegue", sender: self)
    }

    
    @IBAction func logoutAction(_ sender: Any) {
                   self.performSegue(withIdentifier: "naviSegue", sender: self)
    }
    
    
    @IBAction func goToLoginView(_ sender: Any) {
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(nextView, animated: true)
    }
    
    
}