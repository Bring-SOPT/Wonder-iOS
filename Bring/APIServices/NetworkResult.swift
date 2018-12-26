//
//  NetworkResult.swift
//  Bring
//
//  Created by 박소현 on 26/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//


enum NetworkResult<T> {
    case success(T)
    case error(Error)
}
