//
//  orderDetailList.swift
//  Bring
//
//  Created by 박소현 on 11/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import ObjectMapper

struct orderDetailList: Mappable {
    

    var name: String?
    var size: Int?
    var orderCount: Int?
    var totalPrice: Int?
    var memo: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        size <- map["size"]
        orderCount <- map["orderCount"]
        totalPrice <- map["totalPrice"]
        memo <- map["memo"]
        
        
    }
}

