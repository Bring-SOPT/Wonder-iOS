//
//  SignupVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var NameField: UITextField!
    @IBOutlet var PartField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupAction(_ sender: Any) {
       
  
        
        guard NameField.text?.isEmpty != true else {return}
         guard EmailField.text?.isEmpty != true else {return}
         guard PasswordField.text?.isEmpty != true else {return}
         guard PartField.text?.isEmpty != true else {return}
        
        UserService.shared.signUp(name: gsno(NameField.text), email: gsno(EmailField.text), password: gsno(PasswordField.text), part: gsno(PartField.text)) {
            [weak self] in
            guard let `self` = self else {return}
            print("낙타")
            self.performSegue(withIdentifier: "naviSegue", sender: self)
        }
        
        }
    
       
        
    }
    


