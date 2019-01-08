//
//  OrderData.swift
//  Bring
//
//  Created by 박소현 on 08/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct OrderData: Mappable {
    
    
    var nick: String?
    var orderList: [orderList]?
    
    
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        nick <- map["nick"]
        orderList <- map["orderList"]
        
    }
}

