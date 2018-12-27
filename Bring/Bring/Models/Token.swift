//
//  Token.swift
//  Bring
//
//  Created by 박소현 on 26/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//


import ObjectMapper

struct Token: Mappable {
    
    var token: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        token <- map["token"]
    }
}
