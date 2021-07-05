//
//  OutpayInfo.swift
//  project0310
//
//  Created by 김가은 on 2021/04/05.
//

import Foundation
import UIKit

class OutpayInfo: UITableViewController{
    let cellIdentifier: String = "cell"
    private let list: [String] = ["개인정보 정책","서비스 이용약관","오픈소스 라이선스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //row에 해당되는 cell을 알려죵
       //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴.
        let cell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) //인자값을 이용해 프로토타입 셀을 찾고 이를 인스턴스로 생성하여 우리에게 제공.
        
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let text: String = list[indexPath.row] //제일 먼저 데이터 소스를 읽어와
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
        default: //default뭐로 할래?
            guard let uvc = self.storyboard?.instantiateViewController(identifier: "Myinfo")else{
                return
            }
            self.navigationController?.pushViewController(uvc, animated: true)
        }
    }
    
}
