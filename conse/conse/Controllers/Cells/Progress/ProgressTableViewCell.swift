//
//  ProgressTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 30/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_insignia: UIImageView!
    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
