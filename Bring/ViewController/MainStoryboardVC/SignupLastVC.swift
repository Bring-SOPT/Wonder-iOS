//
//  SignupLastVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class SignupLastVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func signupFinishAction(_ sender: Any) {
          self.performSegue(withIdentifier: "naviSegue", sender: self)
    }
    

}
