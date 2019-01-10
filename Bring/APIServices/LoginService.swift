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
    func login(id: String, password: String, completion: @escaping () -> Void) {
        let body = [
            "id" : id,
            "password" : password
        ]
        postable(loginURL, body: body, header: headers) { res in
            switch res {
            case .success(let value):
                guard let status = value.status else { return }
                if status == 200 {
                    guard let token = value.data?.token else { return }
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.synchronize()
                    completion()
                }
            case .error(let error):
                print(error)
            }
        }
    }
    
}
