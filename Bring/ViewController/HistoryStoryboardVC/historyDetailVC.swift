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
    
    var DetailList = [orderDetailList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(orderListView)
        setLabel()
//        orderListTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        cell.menuNameLabel.text = Detail.name
        cell.menuSizeAndNumberLabel.text = "\(gino(Detail.size))"+"\(gino(Detail.orderCount))"
        cell.requestLabel.text = Detail.memo
        cell.priceLabel.text = "\(gino(Detail.totalPrice))"
        return cell

    }


}
