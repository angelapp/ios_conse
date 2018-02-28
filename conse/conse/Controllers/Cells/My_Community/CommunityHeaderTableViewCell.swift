//
//  CommunityHeaderTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 23/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class CommunityHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var btn_openClose: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
