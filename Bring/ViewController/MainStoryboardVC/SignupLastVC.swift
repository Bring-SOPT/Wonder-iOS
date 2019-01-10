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
    @IBOutlet weak var doneBtn: UIButton!
    
    var allCheck:Bool = false
    var serCheck:Bool = false
    var priCheck:Bool = false
    
    //SignupFirstVC와 SignupSecondVC에서 받아온 data를 서버 넘겨주기 위한 변수
    var finalIDData : String?
    var finalPWData : String?
    var finalNickData : String?
    var finalProfileData : UIImage?
    
    var idData : String?
    var pwData : String?
    var nickData : String?
    var profileData : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
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
            allCheck = true
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
            allCheck = false
        }
    }
    
    @IBAction func serviceAction(_ sender: UIButton) {
        
        serCheck = !serCheck
        
        if(serCheck){//serCheck가 true로 바뀜.
            if(priCheck){//priCheck가 true였을 때
                allCheck = true
                serCheck = true
                priCheck = true
                allServiceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                privateCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                
            }
            else{
                allCheck = false
                serCheck = true
                priCheck = false
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                privateCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)

            }
        }
            
        else{//serCheck가 false로 바뀜.
            if(priCheck){//priCheck가 true였을 때
                allCheck = false
                serCheck = false
                priCheck = true
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                privateCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)

            }
            else{
                allCheck = false
                serCheck = false
                priCheck = false
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                privateCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
            }
        }
    }
    
    @IBAction func privateAction(_ sender: UIButton) {

        priCheck = !priCheck
        
        if(priCheck){//priCheck가 true로 바뀜
            if(serCheck){
                allCheck = true
                serCheck = true
                priCheck = true
                
                allServiceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                serviceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            }
            else{
                allCheck = false
                serCheck = false
                priCheck = true
                
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                serviceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
            }
        }
        
        else{//priCheck가 false로 바뀜
            if(serCheck){
                allCheck = false
                serCheck = true
                priCheck = false
                
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                serviceCheckbtn.setImage(UIImage(named:"allSelectedCheckbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
            }
            else{
                allCheck = false
                serCheck = false
                priCheck = false
                
                allServiceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                serviceCheckbtn.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                sender.setImage(UIImage(named:"Checkbox.png"), for: UIControl.State.normal)
                
            }
            
        }
    }

    //전달받은 data를 셋팅하기 위한 함수
    func setup() {
        if let transData = finalIDData {
            idData = transData
        }
        if let transData2 = finalPWData {
            pwData = transData2
        }
        if let transData3 = finalNickData {
            nickData = transData3
        }
        if let transData4 = finalProfileData {
            profileData = transData4
        }
    }
    
    @IBAction func signupFinishAction(_ sender: Any) {
        
        //전체 동의일 때 회원가입이 되어야함.
        if allCheck == true
        {
            doneBtn.backgroundColor = UIColor(red: 250, green: 114, blue: 110, alpha: 1)
            
            //          self.performSegue(withIdentifier: "naviSegue", sender: self)
            
            UserService.shared.signUp(id: idData!, password: pwData!, nick: nickData!, profile: UIImage()) {
                [weak self] data in
                guard let `self` = self else {return}
                guard let status = data.status else { return }
                switch status {
                case 201:
                    print("회원가입 완료")
                    self.performSegue(withIdentifier: "unwindToLogin", sender: self)
                case 400:
                    print("회원가입 실패")
                default:
                    print("회원가입 실패")
                }
            }
        }
        //회원가입은 안되는 건 맞는데 무작정 넘어감..... 첫 페이지로;
        else{
            print("동의버튼 체크 안함")
            let alert = UIAlertView()
            alert.title = "전체 동의를 하세요."
            alert.message = "뿌잉."
            alert.addButton(withTitle: "ㅇㅋ")
            alert.show()
//            self.performSegue(withIdentifier: "SignupLastVC", sender: self)
        }
        
    }
    
    

    }
    
    

