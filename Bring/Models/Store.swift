//
//  Store.swift
//  Bring
//
//  Created by 박소현 on 04/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import ObjectMapper

struct Store: Mappable {
    

    var storeIdx: Int?
    var storePhoto: String?
    var menuList: [Menu]?
    
   
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        storeIdx <- map["storeIdx"]
        storePhoto <- map["bgPhotoUrl"]
        menuList <- map["menuList"]
 
        }
    }

