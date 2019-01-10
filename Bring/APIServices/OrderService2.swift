//
//  OrderService2.swift
//  Bring
//
//  Created by 박소현 on 11/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import Alamofire

struct OrderService2: APIManager, Requestable {
    typealias NetworkData = ResponseObject<orderDetailData>
    static let shared = OrderService2()
    let orderURL = url("/orders")
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    
    
    func OrderListDetail(Idx: Int, completion: @escaping (orderDetailData) -> Void) {
        typealias NetworkData = ResponseObject<orderDetailData>
        let queryURL = orderURL + "/\(Idx)"
        gettable(queryURL, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                //                print(value.status)
                guard let OrderDetail = value.data else
                {return}
                
                completion(OrderDetail)
            case .error(let error):
                print(error)
            }
        }
        
    }
    
    
    //    func Order(Idx: Int, orderMenuList: [String], completion: @escaping)
    
}


