//
//  CafeModel.swift
//  Bring
//
//  Created by 박소현 on 03/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct CafeModel: Mappable {
    var cafeIdx: Int?
    var cafeName: String?
    var cafeLati: Double?
    var cafeLong: Double?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        cafeIdx <- map["storeIdx"]
        cafeName <- map["storeName"]
        cafeLati <- map["latitude"]
        cafeLong <- map["longitude"]
        
    }
}

