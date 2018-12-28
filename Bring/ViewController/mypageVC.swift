//
//  mypageVC.swift
//  Bring
//
//  Created by 박소현 on 28/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit

class mypageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextVC(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "testVC") as? testVC else { return }
        //
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
