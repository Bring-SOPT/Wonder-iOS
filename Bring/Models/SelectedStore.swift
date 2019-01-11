//
//  SelectedStore.swift
//  Bring
//
//  Created by 박소현 on 06/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import ObjectMapper

struct SelectedStore: Mappable {
    
    
    var storeName: String?
    var storeType: String?
    var storeAddress: String?
    var storeNumber: String?
    var storePhoto: [String]?
    
    
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        storeName <- map["name"]
        storeType <- map["type"]
        storeAddress <- map["address"]
        storeNumber <- map["number"]
        storePhoto <- map["photoUrl"]
    }
}

