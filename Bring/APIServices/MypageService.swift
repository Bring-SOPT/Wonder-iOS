//
//  MypageService.swift
//  Bring
//
//  Created by 박소현 on 03/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct MypageService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<MyPageData>
    static let shared = MypageService()
    
    let token = UserDefaults.standard.string(forKey: "token")!
    
    let myPageURL = url("/users")
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
    //마이페이지 api
    func myPage(token: String, completion: @escaping (MyPageData) -> Void){
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : token
        ]
        
        gettable(myPageURL, body: nil, header: header) { (res) in
            switch res{
            case .success(let value) :
                guard let mypagedata = value.data
                    else {return}
                completion(mypagedata)
            case .error(let error):
                print(error)
            }
        }
}
}
<<<<<<< HEAD


//    //로그인 api
//    func login(id: String, password: String, completion: @escaping (Token) -> Void) {
//        let body = [
//            "id" : id,
//            "password" : password,
//            ]
//        postable(loginURL, body: body, header: headers) { res in
//            switch res {
//            case .success(let value):
//                guard let token = value.data else {return}
//                completion(token)
//            case .error(let error):
//                print(error)
//            }
//        }
//    }
=======
}
>>>>>>> bfe7f50617836faa69f2eef80b52017e3fd1ab98
