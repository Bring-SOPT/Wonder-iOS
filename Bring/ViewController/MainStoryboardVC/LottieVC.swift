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
        animate()

        
    
    }
    
    func animate(){
        animationView.frame.size = CGSize(width: 550, height: 650)
        animationView.center = self.view.center
        self.view.addSubview(animationView)
        animationView.play()
        
    }


}
