//
//  mypageVC.swift
//  Bring
//
//  Created by 박소현 on 28/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class mypageVC: UIViewController {

    @IBOutlet var loginCheckView: UIView!
    @IBOutlet weak var myPageNick: UILabel!
    @IBOutlet weak var whiteImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
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
        MypageService.shared.myPage(token: token, completion:{[weak self] (res) in
            guard let `self` = self else {return}
            self.whiteImage.isHidden = true
            self.myPageNick.text = res.nick
            self.profileImage.imageFromUrl(res.profileUrl, defaultImgPath: "")
        })
        if token != "" {
            print("isLogin")
            loginCheckView.isHidden = true
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        print("로그아웃")
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.synchronize()
//        loginCheck()
//        view.layoutIfNeeded()
        viewDidLoad()
        whiteImage.isHidden = false
        myPageNick.text = " "
        loginCheckView.isHidden = false
    }
    
    @IBAction func goToLoginView(_ sender: Any) {
        //그리고 자동로그인을 어떻게 구현해야할지 질문
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        self.present(nextView, animated: true)
    }
}
