//
//  LottieVC.swift
//  Bring
//
//  Created by Kim  Haneul on 2019. 1. 12..
//  Copyright © 2019년 sohyeon. All rights reserved.
//

import UIKit
import Lottie

class LottieVC: UIViewController {

    

    
   var animationView = LOTAnimationView(name: "BringLottie")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(animationView)
                animate()

//        tabBar()

     

    
    }
    
    func animate(){
        animationView.frame.size = CGSize(width: 250, height: 400)
        animationView.center = self.view.center
        self.view.addSubview(animationView)
        animationView.play()
        print("에니메이션")
    }



    @IBAction func startAction(_ sender: Any) {
        print("ddddd")
           performSegue(withIdentifier: "startSegue", sender: self)
    }
}
