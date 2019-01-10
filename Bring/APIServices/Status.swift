//
//  Status.swift
//  Bring
//
//  Created by Kim  Haneul on 2019. 1. 10..
//  Copyright © 2019년 sohyeon. All rights reserved.
//

import Foundation

enum Status: Int {
    case OK = 200
    case Created = 201
    case NoContent = 204
    case Duplicate = 400
    case Unauthorized = 401
    case NotFound = 404
    case ServerErr = 500
}
