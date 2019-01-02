//
//  SignupSecondVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class SignupSecondVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nickTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupLastVC") as? SignupLastVC else { return }
        //
        present(dvc,animated: true)
    }
    

}
