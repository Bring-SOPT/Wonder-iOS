//
//  LoginVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 26..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    @IBAction func signupAction(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupFirstVC") as? SignupFirstVC else { return }
        //
       present(dvc,animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let id = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        LoginService.shared.login(id: id, password: password) {
            [weak self] (data) in
            guard let `self` = self else {return}
            
            
            self.performSegue(withIdentifier: "naviSegue", sender: self)
            
        }
    }
    

}
