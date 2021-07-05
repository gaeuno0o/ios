//  BlockList.swift
//  project0310
//
//  Created by 김가은 on 2021/03/29.
import UIKit
import Foundation

class BlockList: UITableViewController, UISearchResultsUpdating {
    
    let cellIdentifier: String = "blockcell"
    var lists = [[String:Any]]()
    
    let defaults = UserDefaults.standard
    let searchController = UISearchController(searchResultsController: nil)
        
    override func viewDidLoad() { //뷰 컨트롤러의 루트 뷰가 스토리 보드에서 만들어 로드될 때 호출되는 메소드
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        lists = UserDefaults.standard.array(forKey: "lists") as? [[String: Any]] ?? []
        tableView.reloadData()
        
       
        self.navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    } 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //tableview에 row가 몇개여야 하는지? 행 개수를 결과값으로 반환하는 용도가 아님!
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //row에 해당되는 cell을 알려죵
       //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴.
        let cell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) //인자값을 이용해 프로토타입 셀을 찾고 이를 인스턴스로 생성하여 우리에게 제공.
        
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let text = lists[indexPath.row] //제일 먼저 데이터 소스를 읽어와
        cell.textLabel?.text = text["number"] as? String
        
        return cell
    }
    
    @IBAction func addList(_ sender: Any) {
        //1. cell 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        let alert = UIAlertController(title: "직접 추가", message: "차단 할 전화번호를 입력해주세요.", preferredStyle: .alert)
        //2.알림창에 입력폼을 추가한다.
            alert.addTextField(){ (tf) in
                tf.placeholder = "ex)01012345678"
            }
        
        
            //3.OK 버튼 객체를 생성 : 아직 알림창 객체에 버튼이 등록되지않은 상태
            let ok  = UIAlertAction(title: "확인", style: .default){ (_) in
                
            //4.알림창의 0번째 입력필드에 값이 있다면
                if let title = alert.textFields?[0].text{ // textfield 값 유무 판단하기
                    //5.배열에 입력된 값을 추가하고 테이블을 갱신
                    if title.count != 0 {
                        self.defaults.set(title, forKey: "numbers")
                        self.defaults.synchronize()
                       
                        self.tableView.reloadData()
                    }
                    
                }
              
//                if let title = alert.textFields?[0].text{ // textfield 값 유무 판단하기
//                    //5.배열에 입력된 값을 추가하고 테이블을 갱신
//
//                    self.lists.append(title)
//                    self.tableView.reloadData()
//                }
            }
            //취소 버튼 객체를 생성 : 아직 알림창 객체에 버튼이 등록되지 않은 상태
            let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
                
            //6.알림창 객체에 버튼 객체를 등록한다.
            alert.addAction(ok)
            alert.addAction(cancel)
                
            //7.알림창을 띄운다.
            self.present(alert, animated: false)
    }
    
    //밀어서 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic) //[]이걸로 감싸는 이유?
        }
    }
    
}
