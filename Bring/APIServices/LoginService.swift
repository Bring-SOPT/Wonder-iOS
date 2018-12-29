//
//  LoginService.swift
//  Bring
//
//  Created by 박소현 on 29/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//


import Alamofire

struct LoginService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Token>
    static let shared = LoginService()
    let loginURL = url("/login")
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //로그인 api
    func login(id: String, password: String, completion: @escaping (Token) -> Void) {
        let body = [
            "id" : id,
            "password" : password,
            ]
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                guard let token = value.data else {return}
                completion(token)
            case .error(let error):
                print(error)
            }
        }
        
    }
    
}
