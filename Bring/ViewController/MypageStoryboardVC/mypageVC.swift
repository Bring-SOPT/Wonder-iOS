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
    
    @IBOutlet var loginCheckView: UIView!
    
    //로그인 후 해당 아이디 token 받아오기
    let token = UserDefaults.standard.string(forKey: "token")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheck()
        self.view.addSubview(loginCheckView)
        
    }
    
    func loginCheck() {
//        self.performSegue(withIdentifier: "naviSegue", sender: self)
        
    }

    
    @IBAction func logoutAction(_ sender: Any) {
        print("logout버튼 ***")
        print(token)
        self.performSegue(withIdentifier: "naviSegue", sender: self)
        
    }
    
    
    @IBAction func goToLoginView(_ sender: Any) {
        //그리고 자동로그인을 어떻게 구현해야할지 질문
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(nextView, animated: true)
        

    }
    
    
}
