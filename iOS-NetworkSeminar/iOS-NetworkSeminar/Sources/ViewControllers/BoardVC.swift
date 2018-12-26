//
//  BoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class BoardVC: UIViewController {

    @IBOutlet var BoardTable: UITableView!
    
    var boardList = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BoardTable.dataSource = self
        BoardTable.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let index = BoardTable.indexPathForSelectedRow{
            BoardTable.deselectRow(at: index, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BoardService.shared.getBoardList(offset: nil, limit: nil) {
            [weak self] (data) in
            guard let `self` = self else {return}
            self.boardList = data
            self.BoardTable.reloadData()
        }
       
        
    }
    
    
    @IBAction func writeAction(_ sender: Any) {
       guard let dvc = storyboard?.instantiateViewController(withIdentifier: "WriteBoardVC") as? WriteBoardVC else { return }
         navigationController?.pushViewController(dvc, animated: true)
        
    }

    
    
    @IBAction func unwindToBoard(_ segue: UIStoryboardSegue){
    
    }
}

extension BoardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardCell
        let board = boardList[indexPath.item]
        
        cell.titleLabel.text = board.boardTitle
        cell.contentsLabel.text = board.boardContents
        cell.nameLabel.text = "\(gino(board.boardId))번째 글"
        cell.likeLabel.text = "좋아요 \(gino(board.boardLike))개"
        cell.imgView.imageFromUrl(gsno(board.boardPhoto), defaultImgPath: "")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
//        이거 컬렉션뷰에서는 되는데 여기선 안됨 ㅜㅜ 왜인지는 모름
//        cell.timeLabel.text = formatter.string(from: board.boardDate!)

        
        return cell
    }
    
}

extension BoardVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DetailBoardVC") as! DetailBoardVC
        let board = boardList[indexPath.row]
        nextVC.boardtitle = board.boardTitle
        nextVC.contents = board.boardContents
        nextVC.like = board.boardLike
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

