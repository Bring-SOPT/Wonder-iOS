//
//  LoginVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 26..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    var userDefault = UserDefaults.standard
    @IBOutlet weak var idpwNoPopUp: UIImageView!
    var id: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailField.returnKeyType = .done
        PasswordField.returnKeyType = .done
        
        EmailField.delegate = self
        EmailField.tag = 0;
        PasswordField.delegate = self
        PasswordField.tag = 1;
        
        idpwNoPopUp.isHidden = true

    }
    
    @IBAction func signupAction(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupFirstVC") as? SignupFirstVC else { return }
       present(dvc,animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
//        network()
        guard let id = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        LoginService.shared.login(id: id, password: password, completion: {
                        [weak self] (res) in

                        guard let `self` = self else {return}

                        if res.token != nil {
                            self.userDefault.set(res.token!, forKey: "token")
                            print("token 이 nil이 아님")
                            print(res.token)
                            self.performSegue(withIdentifier: "naviSegue", sender: self)
                        }
                        })

//        LoginService.shared.login(id: id, password: password, completion: {
//            [weak self] (data) in
//            guard let `self` = self else {return}
//            switch data.status
//            () in
//            <#code#>
//        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    //로그인해서 토큰 값이 nil이 아니면 naviSegue로 이동.
    func network(){
        guard let id = EmailField.text else {return}
        guard let password = PasswordField.text else {return}
        
        LoginService.shared.login(id: id, password: password, completion: {
            [weak self] (res) in

            guard let `self` = self else {return}

            if res.token != nil {
                self.userDefault.set(res.token!, forKey: "token")
                print("token 이 nil이 아님")
                print(res.token)
                self.performSegue(withIdentifier: "naviSegue", sender: self)
            }
            })
        }
    }

