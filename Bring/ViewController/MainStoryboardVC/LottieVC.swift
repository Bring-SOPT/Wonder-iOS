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

//        tabBar()
//
//        performSegue(withIdentifier: "mainTabBar", sender: self)
//
    
    }
    
    func animate(){
        animationView.frame.size = CGSize(width: 500, height: 800)
        animationView.center = self.view.center
        self.view.addSubview(animationView)
        animationView.play()
        print("에니메이션")
    }


//    func tabBar(){
//        print("탭바세그")
//        performSegue(withIdentifier: "mainTabBar", sender: self)
//    }
}
