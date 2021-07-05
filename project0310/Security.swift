//
//  Security.swift
//  project0310
//
//  Created by 김가은 on 2021/04/05.
//

import Foundation
import UIKit

class Security: UITableViewController{
    
    @IBOutlet weak var appLock: UISwitch!
    @IBOutlet weak var orderinfoLock: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = UserDefaults.standard
        
        //저장된 값을 꺼내어 각 컨트롤에 적용
        self.appLock.isOn = plist.bool(forKey: "requestON")
        self.orderinfoLock.isOn = plist.bool(forKey: "expireON")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    @IBAction func appLock(_ sender: UISwitch) {
        let value = appLock.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "appLock")
        plist.synchronize()
    }
    
    
    @IBAction func orderinfoLock(_ sender: UISwitch) {
        let value = orderinfoLock.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: "appLock")
        plist.synchronize()
    }
    
}
