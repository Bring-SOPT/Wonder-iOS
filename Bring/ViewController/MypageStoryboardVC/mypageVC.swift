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
//    var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEb0lUU09QVCIsInVzZXJfaWR4IjoxfQ.xmbvRqaMuYnGvtPaV_Lw7HorI5blZHlpT7WQgo5ybvM"
    var nick: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginCheckView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginCheck()
    }
    
    func loginCheck() {
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        if token != "" {
            print("isLogin")
            loginCheckView.isHidden = true
        }
    }

    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.synchronize()
        loginCheck()
        view.layoutIfNeeded()
    }
    
    @IBAction func goToLoginView(_ sender: Any) {
        //그리고 자동로그인을 어떻게 구현해야할지 질문
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(nextView, animated: true)
    }
}
