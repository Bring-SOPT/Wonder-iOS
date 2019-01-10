//
//  MapService2.swift
//  Bring
//
//  Created by 박소현 on 06/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct MapService2: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<SelectedStore>
    static let shared = MapService2()
    let mapURL = url("/maps")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    

    func selectedStore(Idx: Int, completion: @escaping
        (SelectedStore) -> Void) {
        
        let queryURL = mapURL + "/stores/\(Idx)"
        gettable(queryURL, body: nil, header: headers) {
            (res) in
            switch res {
            case .success(let value):
                guard let store = value.data else
                {return}
                completion(store)
            case .error(let error):
                print(error)
            }
        }
    }
}
