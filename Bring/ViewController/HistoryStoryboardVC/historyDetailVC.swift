//
//  historyDetailVC.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit

class historyDetailVC: UIViewController {

    
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var orderListView: UIView!
    @IBOutlet var orderListTableView: UITableView!
    
    @IBOutlet var orderNumberLabel: UILabel!
    @IBOutlet var orderDateLabel: UILabel!
    @IBOutlet var orderCafeNameLabel: UILabel!
    
    @IBOutlet var allPriceLabel: UILabel!
    
    var orderIdx: Int?
    var time: String?
    var name: String?
    var orderCafeName: String?
    
    var DetailList = [orderDetailList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(orderListView)
        setLabel()
        orderListTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderCafeNameLabel.text = orderCafeName
        OrderService2.shared.OrderListDetail(Idx: orderIdx!) {
            [weak self] (data) in
            guard let `self` = self else {return}
            self.DetailList = data.orderDetailList!
            self.orderListTableView.reloadData()
        }
        
    }
    
    func setLabel() {
        orderNumberLabel.text = "\(gino(orderIdx))"
        orderDateLabel.text = time
        nickNameLabel.text = name
    }
}

extension historyDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListTableViewCell", for: indexPath) as! orderListTableViewCell
        let Detail = DetailList[indexPath.row]
        var size: String?
        if Detail.size == 0 {
            size = "Small"
        } else if Detail.size == 1 {
            size = "Regular"
        } else if Detail.size == 2 {
            size = "Large"
        } else if Detail.size == 4 {
            size = "Dessert"
        } else {
            size = "휘핑 추가"
        }
        //사이즈 0,1,2 스몰 레귤러 라지 4 디저트 5가 휘핑
        cell.menuNameLabel.text = Detail.name
        cell.menuSizeAndNumberLabel.text = "("+size!+" / \(gino(Detail.orderCount))개)"
        cell.requestLabel.text = Detail.memo
        cell.priceLabel.text = "\(gino(Detail.totalPrice))"
        return cell

    }


}
