//
//  PushNoti.swift
//  project0310
//
//  Created by 김가은 on 2021/04/12.
//

import Foundation
import UIKit

class PushNoti: UITableViewController{
    
    @IBOutlet weak var request: UISwitch!
    @IBOutlet weak var expire: UISwitch!
    @IBOutlet weak var anniversary: UISwitch!
    
    override func viewDidLoad() { //뷰 컨트롤러의 루트 뷰가 스토리 보드에서 만들어 로드될 때 호출되는 메소드
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let plist = UserDefaults.standard
        
        //저장된 값을 꺼내어 각 컨트롤에 적용
        self.request.isOn = plist.bool(forKey: "requestON")
        self.expire.isOn = plist.bool(forKey: "expireON")
        self.anniversary.isOn = plist.bool(forKey: "anniversaryON")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //tableview에 row가 몇개여야 하는지? 행 개수를 결과값으로 반환하는 용도가 아님!
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    @IBAction func request(_ sender: UISwitch) {
        let value = sender.isOn //true - on, false - off
        
        let plist = UserDefaults.standard //저장소 객체 가져옴
        plist.set(value, forKey: "requestON") //requestOn으로 값 저장
        plist.synchronize() //동기화
    }
    
    @IBAction func expire(_ sender: UISwitch) {
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "expireON")
        plist.synchronize()
    }
    
    @IBAction func anniversary(_ sender: UISwitch) {
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "anniversaryON")
        plist.synchronize()
    }
   
}
