//
//  WriteBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class WriteBoardVC: UIViewController {

    @IBOutlet var titleLabel: UITextField!
    @IBOutlet var contentsLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func writeFinishAction(_ sender: Any) {
      
        guard titleLabel.text?.isEmpty != true else {return}
        guard contentsLabel.text?.isEmpty != true else {return}
        
        BoardService.shared.uploadBoard(title: gsno(titleLabel.text), contents: gsno(contentsLabel.text)) {
            self.simpleAlert("글 작성", "게시글이 작성되었습니다.", completion: { (action) in
                self.navigationController?.popViewController(animated: true)
                
            })
            
        }
    }
    
    @IBAction func writeCancelAction(_ sender: Any) {
        performSegue(withIdentifier: "unwindToBoard", sender: self)
    }
    

}
