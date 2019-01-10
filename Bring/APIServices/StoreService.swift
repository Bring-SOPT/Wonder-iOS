//
//  StoreService.swift
//  Bring
//
//  Created by 박소현 on 04/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//


import Alamofire

struct StoreService: APIManager, Requestable {
    
    typealias NetworkData = ResponseObject<Store>
    static let shared = StoreService()
    let storeURL = url("/stores")
    let userDefaults = UserDefaults.standard
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    

    func getMenuList(storeIdx: Int, completion: @escaping (Store) -> Void) {
       //여기서 왜 쿼리 URL 만들고 안쓰는지 ? 질문
        // 그리고 서버위키에 메뉴리스트랑 배경사진 따로받아오는법 질문
        let queryURL = storeURL + "/\(storeIdx)/menu"
        //스토어인덱스 추가해야함
        gettable(queryURL, body: nil, header: headers) { (res) in
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
    
    func loadStoreDetail(storeIdx: Int, completion: @escaping (Store) -> Void) {
        let queryURL = storeURL + "/\(storeIdx)"
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
