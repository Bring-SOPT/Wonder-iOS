//
//  Menu.swift
//  Bring
//
//  Created by 박소현 on 06/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct Menu: Mappable {
    

    
    var menuIdx: Int?
    var menuName: String?
    var menuPhoto: String?
    var menuPrice: Int?
    var menuSize: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {

        menuIdx <- map["menuIdx"]
        menuName <- map["name"]
        menuPrice <- map["price"]
        menuSize <- map["size"]
        menuPhoto <- map["photoUrl"]
    }
}

