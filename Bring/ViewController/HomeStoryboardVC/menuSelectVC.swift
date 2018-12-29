//
//  menuSelectVC.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class menuSelectVC: UIViewController {

    
    @IBOutlet var menuImg: UIImageView!
    @IBOutlet var menuName: UILabel!
    @IBOutlet var menuPrice: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    
    
    @IBOutlet var sizeSelectView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(sizeSelectView)
    }
    
    @IBAction func sizeSelectAction(_ sender: Any) {
      
        if sizeSelectView.isHidden == true {
        sizeSelectView.isHidden = false
        }
        else  { sizeSelectView.isHidden = true }
        
    }
    
    @IBAction func addCartAction(_ sender: Any) {
    }
    
    @IBAction func orderNowAction(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "orderVC") as? orderVC else { return }
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    

    @IBAction func countDownAction(_ sender: Any) {
    }
    
    @IBAction func countupAction(_ sender: Any) {
    }
}
