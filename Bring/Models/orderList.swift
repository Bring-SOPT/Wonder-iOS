//
//  orderList.swift
//  Bring
//
//  Created by 박소현 on 08/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct orderList: Mappable {
    
    
    var orderIdx: Int?
    var name: String?
    var state: Int?
    var time: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        orderIdx <- map["orderIdx"]
        name <- map["name"]
        state <- map["state"]
        time <- map["time"]
    }
}

