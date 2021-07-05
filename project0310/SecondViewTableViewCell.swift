//
//  SecondViewTableViewCell.swift
//  project0310
//
//  Created by 김가은 on 2021/03/19.
//

import UIKit

class SecondViewTableViewCell: UITableViewCell {
    
    @IBOutlet var leftlable: UILabel!
    @IBOutlet var rightbutton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
