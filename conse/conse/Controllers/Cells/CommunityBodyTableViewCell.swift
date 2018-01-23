//
//  CommunityBodyTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 23/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class CommunityBodyTableViewCell: UITableViewCell {
    
    var item: MyCommunityItem!
    var parent: UIViewController!
    var communityDelegate: CommunityProtocol?
    
    @IBOutlet weak var btn_download: UIButton!
    @IBOutlet weak var btn_share: UIButton!
    
    @IBOutlet weak var lbl_objective: UILabel!
    @IBOutlet weak var lbl_note: UILabel!
    @IBOutlet weak var lbl_download: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell() {
        lbl_objective.text = item.objective
        lbl_note.text = item.note
        lbl_download.text = item.downloadCopy
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
        switch sender {
            
        case btn_share:
            communityDelegate?.openShareDocument(documentName: item.file, fileExt: item.ext, action: .share)
            printDebugMessage(tag: "sharing...")
            break
            
        default:
            communityDelegate?.openShareDocument(documentName: item.file, fileExt: item.ext, action: .open)
            printDebugMessage(tag: "opennig...")
            break
        }
    }

}
