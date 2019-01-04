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
    var userName: String?
    var userNick: String?
    var userProfile: String?
    var auth: Bool?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        userId <- map["u_id"]
        userName <- map["u_name"]
        userNick <- map["u_nick"]
        userProfile <- map["u_profile"]
        auth <- map["auth"]
    }
}
