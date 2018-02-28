//
//  FormatBankTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class FormatBankTableViewCell: UITableViewCell {
    
    var item: FormatsBankItem!
    var parent: UIViewController!
    var formatBankDelegate: FormatBankProtocol?

    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var btn_share: UIButton!
    @IBOutlet weak var lbl_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell() {
        lbl_title.text = item.name
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_share:
            formatBankDelegate?.openShareDocument(file: item, action: .share)
            printDebugMessage(tag: "sharing...")
            break
            
        default:
            formatBankDelegate?.openShareDocument(file: item, action: .open)
            printDebugMessage(tag: "opennig...")
            break
        }
    }

}
