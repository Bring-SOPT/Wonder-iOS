//
//  orderMenuList.swift
//  Bring
//
//  Created by 박소현 on 11/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct orderMenuList: Mappable {

    var menuIdx: Int?
    var size: Int?
    var orderCount: Int?
    var memo: String?
    var menuTotalPrice: Int?
    
    
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        menuIdx <- map["menuIdx"]
        size <- map["size"]
        orderCount <- map["memo"]
        menuTotalPrice <- map["menuTotalPrice"]
        memo <- map["memo"]
        
    }
}

