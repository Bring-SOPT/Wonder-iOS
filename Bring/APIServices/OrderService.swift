//
//  OrderService.swift
//  Bring
//
//  Created by 박소현 on 08/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct OrderService: APIManager, Requestable {
    typealias NetworkData = ResponseObject<OrderData>
    static let shared = OrderService()
    let orderURL = url("/orders")
    let header: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    func getOrderList(completion: @escaping (OrderData) -> Void) {
        let queryURL = orderURL
        gettable(queryURL, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                guard let OrderData = value.data else
                {return}
                
                completion(OrderData)
            case .error(let error):
                print(error)
            }
        }
}

    
//    func Order(Idx: Int, orderMenuList: [String], completion: @escaping)
    
}

