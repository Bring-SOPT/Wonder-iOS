//
//  testVC.swift
//  Bring
//
//  Created by 박소현 on 30/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class testVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loginCheck()
       
    }
    
    func loginCheck() {
//          self.performSegue(withIdentifier: "naviSegue", sender: self)
        
    }

    @IBAction func loginAction(_ sender: Any) {
           self.performSegue(withIdentifier: "naviSegue", sender: self)
        
    }
}
