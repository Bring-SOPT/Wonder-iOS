//
//  orderData.swift
//  Bring
//
//  Created by 박소현 on 11/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import Foundation
import UIKit

struct Menus {
    var menuIdx: Int
    var size: Int
    var orderCount: Int
    var memo: String
    var menuTotalPrice: Int
}

struct MenuUtils {
    static let shared = MenuUtils()
    
    func getBody(_ menus: [Menus]) -> [[String: Any]] {
        var bodys: [[String: Any]] = [[String: Any]]()
        var body: [String: Any] = [:]
        for i in 0..<menus.count {
            body["menuIdx"] = menus[i].menuIdx
            body["size"] = menus[i].size
            body["orderCount"] = menus[i].orderCount
            body["memo"] = menus[i].memo
            body["menuTotalPrice"] =  menus[i].menuTotalPrice
            bodys.append(body)
        }
        return bodys
    }
}
