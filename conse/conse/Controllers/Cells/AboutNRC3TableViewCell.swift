//
//  AboutNRC3TableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

/** Celda para ajustar los campos del TAB_3 (DONDE TRABAJAMOS) */
class AboutNRC3TableViewCell: UITableViewCell {

    @IBOutlet weak var img_map: UIImageView!
    
    @IBOutlet weak var lbl_link_facebook: UILabel!
    @IBOutlet weak var lbl_link_office: UILabel!
    @IBOutlet weak var lbl_link_twitter: UILabel!
    @IBOutlet weak var lbl_where_1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
