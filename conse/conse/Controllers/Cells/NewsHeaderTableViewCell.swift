//
//  NewsHeaderTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 14/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class NewsHeaderTableViewCell: UITableViewCell {

    // MARK: - Outlet
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
