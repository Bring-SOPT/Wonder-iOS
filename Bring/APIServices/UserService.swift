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
    func signUp(id: String, password: String, nick: String, profile: UIImage, completion: @escaping (ResponseObject<User>) -> Void) {
        
        Alamofire.upload(multipartFormData: { formdata in
            formdata.append(id.data(using: .utf8)!, withName: "id")
            formdata.append(password.data(using: .utf8)!, withName: "password")
            formdata.append(nick.data(using: .utf8)!, withName: "nick")
            formdata.append(profile.jpegData(compressionQuality: 0.5) ?? Data(), withName: "profile", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: userURL) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseObject { (res: DataResponse<NetworkData>) in
                    switch res.result {
                    case .success:
                        guard let value = res.result.value else { return }
                        completion(value)
                    case .failure(let err):
                        print(err)
                    }
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func loadMypage() {
        
    }
    
    //아이디 중복 체크
    func validIDCheck(id: String, completion: @escaping (ResponseObject<User>) -> Void, error: @escaping () -> Void){
        
        let queryURL = userURL + "/check?id=\(id)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        gettable(queryURL, body: nil,  header: header) {
            (res) in
            switch res {
            case.success(let value):
                completion(value)
            case.error:
                error()
            }
        }
    }
    
    //닉네임 중복 체크
    func validNickCheck(nick: String, completion: @escaping (ResponseObject<User>) -> Void, error: @escaping() -> Void){
        let queryURL = userURL + "/check?nick=\(nick)"
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        gettable(queryURL, body: nil, header: header) {
            (res) in
            switch res {
            case.success(let value):
                completion(value)
            case.error:
                error()
            }
        }
    }
}
