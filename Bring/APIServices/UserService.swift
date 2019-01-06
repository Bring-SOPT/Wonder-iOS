//
//  UserService.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import Alamofire

struct UserService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<User>
    static let shared = UserService()
    
    let userURL = url("/users")
    let userDefaults = UserDefaults.standard
    
    let headers: HTTPHeaders = [
        "Content-Type" : "multipart/form-data"
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
    
    func loadMypage() {
        
    }
    
    //아이디 중복 체크
    func validIDCheck(id: String, completion: @escaping () -> Void, error: @escaping () -> Void){
        
        let queryURL = userURL + "/check?id=\(id)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        gettable(queryURL, body: nil,  header: header) {
            (res) in
            switch res {
            case.success:
                completion()
            case.error:
                error()
            }
        }
    }
    
    //닉네임 중복 체크
    func validNickCheck(nick: String, completion: @escaping () -> Void){
        let queryURL = userURL + "/check?nick=(nick)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        gettable(queryURL, body: nil, header: header) {
            (res) in
            switch res {
            case.success(let value):
//                guard let nick = value.nick else {return}
                completion()
            case.error(let error):
                print(error)
                
            }
        }
    }
}
