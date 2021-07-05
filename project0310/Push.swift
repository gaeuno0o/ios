//
//  Push.swift
//  project0310
//
//  Created by 김가은 on 2021/03/25.
//

import Foundation
import UIKit

class Push: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "pushcell"
    private let noti: [String] = ["결제 요청", "결제만료 임박", "기념일"]
    
    
    override func viewDidLoad() { //뷰 컨트롤러의 루트 뷰가 스토리 보드에서 만들어 로드될 때 호출되는 메소드
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //tableview에 row가 몇개여야 하는지? 행 개수를 결과값으로 반환하는 용도가 아님!
            return noti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //row에 해당되는 cell을 알려죵
        let pushcell: UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let text: String = noti[indexPath.row]
        pushcell.textLabel?.text = text
        
        if indexPath.section == 1{
        let notiSwitch = UISwitch()
        notiSwitch.addTarget(self, action: #selector(didchageSwitch(_:)), for: .valueChanged)
        pushcell.accessoryView = notiSwitch}
        
        return pushcell
    }
    
    @objc func didchageSwitch(_ sender: UISwitch) {
        if sender.isOn{
            print("turned on")
        }else {
            print("turned off")
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  "푸쉬알림"
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        guard let nextViewController: SecondViewController =
//                segue.description as? SecondViewController else {
//                return
//        }
//
//
//    }
}
