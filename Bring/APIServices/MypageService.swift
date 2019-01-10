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
    
    let myPageURL = url("/users")
    
    //마이페이지 api
    func myPage(token: String, completion: @escaping (MyPageData) -> Void){
        let header: HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : token
        ]
        gettable(myPageURL, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                guard let status = value.status else { return }
                if status == 200 {
                    guard let mypagedata = value.data else {return}
                    completion(mypagedata)
                }
            case .error(let error):
                print(error)
            }
        }
}
}
