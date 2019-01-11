//
//  PaymentService.swift
//  Bring
//
//  Created by 박소현 on 12/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct PaymentService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Store>
    static let shared = PaymentService()
    let paymentURL = url("/orders")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization" : UserDefaults.standard.string(forKey: "token") ?? ""
    ]
    
    func payment(storeIdx: Int, orderMenuList: [Menus], completion: @escaping() -> Void) {
        let body: [String: Any] = [
            "storeIdx": storeIdx,
            "orderMenuList": MenuUtils.shared.getBody(orderMenuList)
        ]
    
        postable(paymentURL, body: body, header: headers) {
            (res) in
            switch res {
            case .success(let value):
                guard let store = value.data else
                {return}
                completion()
            case .error(let error):
                print(error)
            }
            
        }
        
    
    }
    
    
    
    
    
}
        



