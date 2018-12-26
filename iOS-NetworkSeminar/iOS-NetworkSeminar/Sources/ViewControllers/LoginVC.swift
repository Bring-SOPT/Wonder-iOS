//
//  LoginVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let email = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        LoginService.shared.login(email: email, password: password) {
            [weak self] (data) in
            guard let `self` = self else {return}
            
            
            self.performSegue(withIdentifier: "naviSegue", sender: self)
            
            }
    }
    
    @IBAction func joinAction(_ sender: Any) {
     
        if let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC {
            present(dvc, animated: true)
        }
        
    }
    
    
    

}
