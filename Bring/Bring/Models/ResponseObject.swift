//
//  ResponseObject.swift
//  Bring
//
//  Created by 박소현 on 26/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//


import ObjectMapper

struct ResponseObject<T: Mappable>: Mappable {
    
    var status: Int?
    var message: String?
    var data: T?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}
