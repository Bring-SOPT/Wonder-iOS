//
//  User.swift
//  Bring
//
//  Created by 박소현 on 01/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
    
    var userId: String?
    var userNick: String?
    var password: String?
    var userProfile: String?
//    var auth: Bool?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        userId <- map["id"]
        userNick <- map["nick"]
        userProfile <- map["profile"]
        password <- map["password"]
//        auth <- map["auth"]
    }
}
