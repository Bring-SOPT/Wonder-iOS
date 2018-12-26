//
//  BoardService.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import Alamofire

struct BoardService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<Board>
    static let shared = BoardService()
    let boardURL = url("/contents")
    let header: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    //모든 게시글 조회 api
    //게시글을 불러올 때 옵션에 대한 내용이 api명세서에 더 추가되어있습니다.
    //api 명세서를 보시고 한번 시도해보세요!
    func getBoardList(offset: Int? = 0, limit: Int? = 10, completion: @escaping ([Board]) -> Void) {
        let queryURL = boardURL + "?offset=\(offset ?? 0)&limit=\(limit ?? 10)"
        gettable(boardURL, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                guard let boardList = value.data else
                {return}
                completion(boardList)
            case .error(let error):
                print(error)
            }
        }
    }
    
    //게시글 상세 조회 api
    func getBoardDetail(id: Int, completion: @escaping (Board) -> Void) {
        //코드 작성
    }
    
    
    //글 작성 api
    //이 api는 조금 다른방식의 request를 보냅니다. 한번 도전해봅시다!
    func uploadBoard(title: String, contents: String, completion: @escaping () -> Void) {
        //코드 작성
        
        
        // 토큰이 필요하여 테스트 토큰을 헤더에 넣어두었습니다.
        // 네트워크 과제에서는 직접 로그인을 하고 응답받은 토큰을 사용하시면 됩니다.
        let uploadHeaders: HTTPHeaders = [
            "Authorization": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEb0lUU09QVCIsInVzZXJfaWR4IjoxM30._Pb5bXKOV4XQrT3VMkpyh1wHGXmz5e4J7pBJ01MnC6o"
        ]
        
        // 업로드 함수를 통해 먼저 여러 데이터를 multipart로 인코딩하는 과정을 거치게 됩니다.
        // 아래의 과정으로 텍스트와 이미지 데이터를 Data 타입으로 변환시켜 multipart에 append를 해줍니다.
        Alamofire.upload(multipartFormData: { (multipart) in
            multipart.append(title.data(using: .utf8)!, withName: "title")
            multipart.append(contents.data(using: .utf8)!, withName: "contents")
            //            multipart.append(image.jpegData(compressionQuality: 0.5)!, withName: "photo", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to: boardURL,
           headers: uploadHeaders) { (result) in
            
            //멀티파트로 성공적으로 인코딩 되었다면 success, 아니라면 failure 입니다.
            switch result {
            case .success(let upload, _, _):
                
                // 성공 하였다면 아래의 과정으로 응답 리스폰스에 대한 처리를 합니다.
                // 여기부터는 request 함수와 동일합니다.
                upload.responseObject { (res: DataResponse<ResponseArray<Board>>) in
                    switch res.result {
                    case .success:
                        completion()
                    case .failure(let err):
                        print(err)
                    }
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    //게시글 좋아요 api
    func like(boardLike: Int, completion: @escaping () -> Void) {
       
        let body = [
            "boardLike" : boardLike
        ]
        postable(boardURL, body: body, header: header) { res in
            switch res {
            case .success(let value):
                // guard let user = value.data else {return}
                completion()
            case .error(let error):
                print(error)
            }
        }
        
    }
    
    
}
