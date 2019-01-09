//
//  MyPageData.swift
//  Bring
//
//  Created by Kim  Haneul on 2019. 1. 9..
//  Copyright © 2019년 sohyeon. All rights reserved.
//

import ObjectMapper

struct MyPageData: Mappable {
    
    var userIdx: Int?
    var nick: String?
    var profileUrl: String?
    var auth: Bool?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        userIdx <- map["userIdx"]
        nick <- map["nick"]
        profileUrl <- map["profileUrl"]
        auth <- map["auth"]
    }
}
