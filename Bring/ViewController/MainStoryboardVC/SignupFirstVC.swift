//
//  SignupVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 26..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class SignupFirstVC: UIViewController {

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var PasswordConfirmField: UITextField!
    
    @IBOutlet var passwordOkLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func idOkAction(_ sender: Any) {
        
        
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        
        if PasswordField.text != PasswordConfirmField.text {
            passwordOkLabel.isHidden = false
        } else {
        
            guard EmailField.text?.isEmpty != true else {return}
            guard PasswordField.text?.isEmpty != true else {return}
            
            UserService.shared.signUp(id: gsno(EmailField.text), password: gsno(PasswordField.text), nick: "테스트용", profile: "ㅇㅇㅇ") {
                [weak self] in
                guard let `self` = self else {return}
                
                guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SignupSecondVC") as? SignupSecondVC else { return }
                self.present(dvc,animated: true)
                print("ddddd")
                }
            
            }
            
        }
    
    

}
