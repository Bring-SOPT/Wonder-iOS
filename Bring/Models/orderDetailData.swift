//
//  orderDetailData.swift
//  Bring
//
//  Created by 박소현 on 11/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct orderDetailData: Mappable {
    
    var store: String?
    var orderDetailList: [orderDetailList]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        store <- map["store"]
        orderDetailList <- map["orderDetailList"]
        
    }
}

