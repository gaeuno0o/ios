//
//  DetailController.swift
//  project0310
//
//  Created by 김가은 on 2021/03/29.
//

import UIKit

class DetailController: UIViewController {
    var nameOfCell: String? //리스트 타이틀에 띄우기
    var numOfCell: Int? // cell number

    @IBOutlet weak var naviTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = nameOfCell
        NSLog("\(numOfCell)")
    }
}
