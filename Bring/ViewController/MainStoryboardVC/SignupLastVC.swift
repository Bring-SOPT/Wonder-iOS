//
//  SignupLastVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class SignupLastVC: UIViewController {

    @IBOutlet weak var allServiceCheckbtn: UIButton!
    @IBOutlet weak var serviceCheckbtn: UIButton!
    @IBOutlet weak var privateCheckbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func allServiceAction(_ sender: UIButton) {
        
        sender.setImage(UIImage(named:"allSelectedCheckbox.png"
        ), for: UIControl.State.normal)
        serviceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"
        ), for: UIControl.State.normal)
        privateCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"
        ), for: UIControl.State.normal)
        
        
        
    }
    @IBAction func serviceAction(_ sender: UIButton) {
    }
    @IBAction func privateAction(_ sender: UIButton) {
    }
    
    

    @IBAction func signupFinishAction(_ sender: Any) {
          self.performSegue(withIdentifier: "naviSegue", sender: self)
    }
    

}
