//
//  SignupVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2018. 12. 26..
//  Copyright © 2018년 sohyeon. All rights reserved.
//

import UIKit

class SignupFirstVC: UIViewController, UITextFieldDelegate{

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    @IBOutlet var PasswordConfirmField: UITextField!
    @IBOutlet weak var idValidOkLabel: UILabel!
    @IBOutlet var passwordOkLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard return을 done으로 바꾸기
        EmailField.returnKeyType = .done
        PasswordField.returnKeyType = .done
        PasswordConfirmField.returnKeyType = .done
        EmailField.delegate = self
        EmailField.tag = 0;
        PasswordField.delegate = self
        PasswordField.tag = 1;
        PasswordConfirmField.delegate = self
        PasswordConfirmField.tag = 2;

    }
    
    //중복확인 버튼
    @IBAction func idOkAction(_ sender: Any) {
        
        
        
        guard let id = EmailField.text else {return}
        
        UserService.shared.validIDCheck(id: id, completion: {
            [weak self] () in
            guard let `self` = self else {return}
            self.idValidOkLabel.isHidden = false
        }) {
            [weak self] () in
            guard let `self` = self else {return}
            self.idValidOkLabel.isHidden = true
        }
        
        
    }
 
        
        
        
    @IBAction func nextAction(_ sender: Any) {
        
        if PasswordField.text != PasswordConfirmField.text {
            passwordOkLabel.isHidden = false
        } else{
//            guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SignupSecondVC") as? SignupSecondVC else { return }
//
            if let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupSecondVC") as? SignupSecondVC {
                let check = !(EmailField.text?.isEmpty ?? true)
                let check2 = !(PasswordField.text?.isEmpty ?? true)
                
                if check {
                    dvc.realIDData = EmailField.text
                }
                if check2 {
                    dvc.realPWData = PasswordField.text
                }
                print("vc???ok!!")
                self.present(dvc,animated: true)
            }
//            self.present(dvc2,animated: true)
            print("ddddd")
        }
        
    }

    
    //화면 다른 곳 터치 시 keyboard 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    //keyboard에서 done버튼 누르면 다음 입력창으로 이동
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
}
