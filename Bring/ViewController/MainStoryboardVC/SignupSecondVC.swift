//
//  SignupSecondVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class SignupSecondVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickNameField: UITextField!
    @IBOutlet weak var nickNameOkLabel: UILabel!
    
    var realIDData : String?
    var realPWData : String?
    
    
    var idData : String?
    var pwData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nickNameField.returnKeyType = .done
         setupTap()
        setup()
    }
    
    //keyboard 밖 touch하면 keyboard 숨기기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    //전달받은 data를 셋팅하기 위한 함수
    func setup() {
        if let transData = realIDData {
            idData = transData
        }
        if let transData2 = realPWData {
            pwData = transData2
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        guard nickNameField.text?.isEmpty != true else {return}
        
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupLastVC") as? SignupLastVC else { return }
//
//
        if let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupLastVC") as? SignupLastVC {
            
            dvc.finalIDData = idData
            dvc.finalPWData = pwData
            
            let check = !(nickNameField.text?.isEmpty ?? true)
            if check {
                dvc.finalNickData = nickNameField.text
            }
            present(dvc,animated: true)
            print("vc???ok!!2222")
        }

        
        
        
//        present(dvc,animated: true)



        
        }
    
    
    @IBAction func nickOkAction(_ sender: Any) {
        guard let nick = nickNameField.text else {return}
        
        UserService.shared.validNickCheck(nick: nick, completion: {[weak self] (data) in
            guard let `self` = self else {return}
            switch data.status {
            case 200: self.nickNameOkLabel.isHidden = false
            case 400: self.nickNameOkLabel.isHidden = true
            default: self.nickNameOkLabel.isHidden = true
            }
        }){
            
        }
        
    }
    
    func setupTap() {
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        self.view.addGestureRecognizer(viewTap)
        self.profileImage.addGestureRecognizer(imageTap)
    }
    
    @objc func viewTapped() {
        self.view.endEditing(true)
    }
    
    @objc func imageTapped() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.showsCameraControls = true
                self.present(picker, animated: true)
            } else {
                print("not available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(actionSheet, animated: true)
    }
}

extension SignupSecondVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //이미지를 선택하지 않고 피커 종료시에 실행되는 delegate 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //이미지 피커에서 이미지를 선택하였을 때 일어나는 이벤트를 작성하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImg = UIImage()
        
        if let possibleImg = info[.editedImage] as? UIImage {
            newImg = possibleImg
        }
        else if let possibleImg = info[.originalImage] as? UIImage {
            newImg = possibleImg
        }
        else {
            return
        }
        profileImage.image = newImg
        dismiss(animated: true, completion: nil)
    }
}

