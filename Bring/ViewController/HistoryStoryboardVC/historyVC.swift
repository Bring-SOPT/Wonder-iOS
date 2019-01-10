//
//  historyVC.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit

class historyVC: UIViewController {

    
    @IBOutlet var historyCollectionView: UICollectionView!
    var orderList1 = [orderList]()
    @IBOutlet var nicknameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        OrderService.shared.getOrderList() {
            [weak self] (data) in
            guard let `self` = self else {return}
            guard let orders = data.orderList else {return}
            guard let nickname = data.nick else {return}
            self.nicknameLabel.text = nickname
            self.orderList1 = orders
            self.historyCollectionView.reloadData()
        }
        
    }
}

extension historyVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderList1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCollectionViewCell", for: indexPath) as! historyCollectionViewCell
        let order = orderList1[indexPath.item]
        cell.orderNumberLabel.text = "\(gino(order.orderIdx))"
        cell.orderCafeLabel.text = order.name
        cell.orderDateLabel.text = order.time
        return cell
        
    }
    
}

extension historyVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = (view.frame.width - 30) / 2
//        let height: CGFloat = (view.frame.width - 30) / 2 + 88
//        return CGSize(width: width, height: height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "historyDetailVC") as! historyDetailVC
        let order = orderList1[indexPath.item]
        nextVC.orderIdx = order.orderIdx
        nextVC.time = order.time
        nextVC.name = nicknameLabel.text
        nextVC.orderCafeName = order.name
//        nextVC.nickNameLabel.text = nicknameLabel.text
//        nextVC.orderCafeNameLabel.text = order.name
//        nextVC.orderDateLabel.text = order.time
//        nextVC.orderNumberLabel.text = "\(gino(order.orderIdx))"

        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
