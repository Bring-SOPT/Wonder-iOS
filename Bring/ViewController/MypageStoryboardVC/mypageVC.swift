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
    var token = UserDefaults.standard.string(forKey: "token")!
//    var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEb0lUU09QVCIsInVzZXJfaWR4IjoxfQ.xmbvRqaMuYnGvtPaV_Lw7HorI5blZHlpT7WQgo5ybvM"
    var nick: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loginCheck()
        self.view.addSubview(loginCheckView)
        
    }
    
    func loginCheck() {
        
        if token != "" {
            loginCheckView.isHidden = true
        }
        
    }

    
    @IBAction func logoutAction(_ sender: Any) {
        print("logout버튼 ***")
//        token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEb0lUU09QVCIsInVzZXJfaWR4IjoxfQ.xmbvRqaMuYnGvtPaV_Lw7HorI5blZHlpT7WQgo5ybvM"
        var nick: String?
        token = ""
        print(token)
        //하늘 :mypage에 token값 보내면 mypage data 제대로 들어오나 테스트
        MypageService.shared.myPage(token: token, completion: {[weak self](res) in
            guard let `self` = self else {return}
            print("불러오기 성공")
            nick = res.nick
            
        })
        print("마이페이지 성공")
        print(nick)
        self.performSegue(withIdentifier: "naviSegue", sender: self)
        
    }
    
    
    @IBAction func goToLoginView(_ sender: Any) {
        //그리고 자동로그인을 어떻게 구현해야할지 질문
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(nextView, animated: true)
        

    }
    
    
}
