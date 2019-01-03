//
//  StoreService.swift
//  Bring
//
//  Created by 박소현 on 04/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct StoreService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<User>
    static let shared = StoreService()
    let userURL = url("/stores")
    let userDefaults = UserDefaults.standard
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //회원 가입 api
    func signUp(id: String, password: String, nick: String, profile: String, completion: @escaping () -> Void) {
        let body = [
            "id" : id,
            "password" : password,
            "nick": nick,
            "profile": profile
        ]
        postable(userURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                // guard let user = value.data else {return}
                completion()
            case .error(let error):
                print(error)
            }
        }
    }
    
    func loadStoreDetail(Idx: Int, completion: @escaping () -> Void) {
        
        
    }
    
}
