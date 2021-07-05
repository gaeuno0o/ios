//
//  Storage.swift
//  project0310
//
//  Created by 김가은 on 2021/06/22.
//

import Foundation
import UIKit

class Storage {
    var name : String?
    var phonenum : Int?
    static var password : Int?
    
//    init(name: String, phonenum: Int, password : Int){
//        self.name = name
//        self.password = password
//        self.phonenum = phonenum
//    }
        
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            return true
        } else {
            return false
        }
    
//        if password != nil {
//            return true
//        }else{
//            return false
//        }
    }
}
