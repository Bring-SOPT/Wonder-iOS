//
//  MapService.swift
//  Bring
//
//  Created by 박소현 on 03/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct MapService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = LoginService()
    let mapURL = url("/maps")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    
    func mapList(lati: Double?, long: Double?, completion: @escaping
        ([CafeModel]) -> Void) {
        let queryURL = mapURL + "?latitude=\(lati)&longitude=\(long)"
        gettable(mapURL, body: nil, header: headers) {
            (res) in
            switch res {
            case .success(let value):
                guard let cafeList = value.data else
                {return}
//                completion(cafeList)
            case .error(let error):
                print(error)
            }
        }
    }
    
}
