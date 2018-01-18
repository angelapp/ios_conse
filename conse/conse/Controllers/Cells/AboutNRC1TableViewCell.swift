//
//  AboutNRC1TableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

/** Celda para ajustar los campos del TAB_1 (QUIENES SOMOS) */
class AboutNRC1TableViewCell: UITableViewCell {

    @IBOutlet weak var img_photo: UIImageView!
    
    @IBOutlet weak var lbl_text_1: UILabel!
    @IBOutlet weak var lbl_about_2: UILabel!
    @IBOutlet weak var lbl_about_3: UILabel!
    @IBOutlet weak var lbl_about_4: UILabel!
    @IBOutlet weak var lbl_about_5: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
