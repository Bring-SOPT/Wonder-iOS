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
    
    
    var allCheck:Bool = false
    var serCheck:Bool = false
    var priCheck:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func allServiceAction(_ sender: UIButton) {
        
        allCheck = !allCheck
        
        if(allCheck){
            
            sender.setImage(UIImage(named:"allSelectedCheckbox.png"
            ), for: UIControl.State.normal)
            serviceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"
            ), for: UIControl.State.normal)
            privateCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"
            ), for: UIControl.State.normal)
            
            serCheck = true
            priCheck = true
        }
            
        else{
            sender.setImage(UIImage(named:"checkBox.png"
            ), for: UIControl.State.normal)
            serviceCheckbtn.setImage(UIImage(named:"checkBox.png"
            ), for: UIControl.State.normal)
            privateCheckbtn.setImage(UIImage(named:"checkBox.png"
            ), for: UIControl.State.normal)
            
            serCheck = false
            priCheck = false
        }
        

    }
    
    @IBAction func serviceAction(_ sender: UIButton) {
        serCheck = !serCheck
        
        if(!serCheck){
            if(allCheck){
                
                allCheck = false
                serCheck = false
                allServiceCheckbtn.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
            }
            else{
                serCheck = false
                sender.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
            }
        }
            
        else {//serCheck가 false일 떄
            
            serCheck = true
            sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            if(priCheck){
                allCheck = true
                allServiceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            }
        }
    }
    
    @IBAction func privateAction(_ sender: UIButton) {
        priCheck = !priCheck
        
        if(!priCheck){
            if(allCheck){
                allCheck = false
                priCheck = false
                allServiceCheckbtn.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
            }
            else{
                priCheck = false
                sender.setImage(UIImage(named:"checkBox.png"), for: UIControl.State.normal)
            }
        }
            
        else{
            priCheck = true
            sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            if(serCheck){
                allCheck = true
                allServiceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            }
        }

    }
    
    

    @IBAction func signupFinishAction(_ sender: Any) {
          self.performSegue(withIdentifier: "naviSegue", sender: self)
    }
    

}
