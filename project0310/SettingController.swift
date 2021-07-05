//
//  SettingController.swift
//  project0310
//
//  Created by 김가은 on 2021/03/29.
//
import UIKit

class SettingController: UITableViewController {
    
    let cellIdentifier: String = "cell"
    private let lists: [String] = ["내 정보", "차단목록", "보안", "푸쉬알림", "공지사항", "문의", "정보"]
    
    override func viewDidLoad() { //뷰 컨트롤러의 루트 뷰가 스토리 보드에서 만들어 로드될 때 호출되는 메소드
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //tableview에 row가 몇개여야 하는지? 행 개수를 결과값으로 반환하는 용도가 아님!
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //row에 해당되는 cell을 알려죵
       //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴.
        let cell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) //인자값을 이용해 프로토타입 셀을 찾고 이를 인스턴스로 생성하여 우리에게 제공.
        
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let text: String = lists[indexPath.row] //제일 먼저 데이터 소스를 읽어와
        cell.textLabel?.text = text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){  //사용자가 특정 행 선택시 액션을 보여줌. Delegate메소드라 적절한 시점에 맞춰 호출
        let rownum = indexPath.row

        switch rownum{
        case 0:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "MyInfo")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
            
        case 1:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "BlockList")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 2:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Security")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 3:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "PushNoti")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 4:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Notice")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 5:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Inquiry")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 6:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "OutpayInfo")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        case 7:
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Myinfo")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        default: //default뭐로 할래?
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Myinfo")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        }
        
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //화면 전환시 자동으로 호출. 화면 이동 전에 실행해야할 코드가 있으면 모두 여기에 작성.
//        if segue.identifier == "ShowDetail" {
//            let dc = segue.destination as? DetailController
//            
//            let path = tableView.indexPathForSelectedRow
//            dc?.nameOfCell = lists[(path?.row)!]
//            dc?.numOfCell = (path?.row)!
//        }
//    }
}
