//
//  CustomeTableViewCell.swift
//  project0310
//
//  Created by 김가은 on 2021/03/18.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    @IBOutlet var leftLable: UILabel!
    @IBOutlet var rightLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell". for: indexPath)
            
            let text: String = indexPath.section == 0? self.korean
        }
        
    }
    
}
