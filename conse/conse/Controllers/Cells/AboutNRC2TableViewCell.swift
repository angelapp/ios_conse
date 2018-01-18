//
//  AboutNRC2TableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

/** Celda para ajustar los campos del TAB_2 (QUE HACEMOS) */
class AboutNRC2TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_wedo_text_1: UILabel!
    @IBOutlet weak var lbl_wedo_text_2: UILabel!
    @IBOutlet weak var lbl_wedo_text_3: UILabel!
    @IBOutlet weak var lbl_wedo_text_4: UILabel!
    @IBOutlet weak var lbl_wedo_text_5: UILabel!
    
    @IBOutlet weak var img_wedo_photo_1: UIImageView!
    @IBOutlet weak var img_wedo_photo_2: UIImageView!
    @IBOutlet weak var img_wedo_photo_3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
