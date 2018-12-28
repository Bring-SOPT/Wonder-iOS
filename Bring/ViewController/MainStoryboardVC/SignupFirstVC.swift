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
    @IBOutlet var NickNameField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func nextAction(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupSecondVC") as? SignupSecondVC else { return }
        //
        present(dvc,animated: true)
    }
    


}
