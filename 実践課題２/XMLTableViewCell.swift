//
//  DelegateTableViewCell.swift
//  実践課題２
//
//  Created by dev室 インターン３ on 2018/11/07.
//  Copyright © 2018年 dev室 インターン３. All rights reserved.
//

import UIKit

class DelegateTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
