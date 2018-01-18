//
//  ShieldBodyTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class ShieldBodyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_address: UIImageView!
    @IBOutlet weak var img_email: UIImageView!
    @IBOutlet weak var img_mobile: UIImageView!
    @IBOutlet weak var img_phone: UIImageView!
    @IBOutlet weak var img_twitter: UIImageView!
    
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_mobile: UILabel!
    @IBOutlet weak var lbl_phone: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_twitter: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
