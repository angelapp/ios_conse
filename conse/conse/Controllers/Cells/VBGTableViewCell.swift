//
//  VBGTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VBGTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    // Module 0 - Page 0
    @IBOutlet weak var M0P0_LBL1: UILabel!
    @IBOutlet weak var M0P0_LBL2: UILabel!
    @IBOutlet weak var M0P0_BTN1: UIButton!

    // Module 0 - Page 1
    @IBOutlet weak var M0P1_LBL1: UILabel!
    @IBOutlet weak var M0P1_IMG1: UIImageView!
    @IBOutlet weak var M0P1_LBL2: UILabel!
    @IBOutlet weak var M0P1_LBL3: UILabel!
    @IBOutlet weak var M0P1_LBL4: UILabel!
    @IBOutlet weak var M0P1_BTN1: UIButton!
    @IBOutlet weak var M0P1_BTN2: UIButton!
    
    // Module 0 - Page 1
    @IBOutlet weak var M1P0_LBL1: UILabel!
    @IBOutlet weak var M1P0_LBL2: UILabel!
    @IBOutlet weak var M1P0_LBL3: UILabel!
    @IBOutlet weak var M1P0_LBL4: UILabel!
    @IBOutlet weak var M1P0_LBL5: UILabel!
    @IBOutlet weak var M1P0_LBL6: UILabel!
    @IBOutlet weak var M1P0_IMG_AVATAR: UIImageView!
    @IBOutlet weak var M1P0_IMG_GLOBO: UIImageView!
    
    // MARK: - Properties
    weak var vbgDelegate: VBGProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillM0P0() {
        M0P0_LBL1.text = VBG_COURSE.M0P0T1
        M0P0_LBL2.text = VBG_COURSE.M0P0T2
    }
    
    func fillM0P1() {
        M0P1_LBL1.text = VBG_COURSE.M0P1T1
        M0P1_LBL2.text = VBG_COURSE.M0P1T2
        M0P1_LBL3.text = VBG_COURSE.M0P1T3
        M0P1_LBL4.text = VBG_COURSE.M0P1T4
    }
    
    func fillM1P0() {
        M1P0_LBL1.text = VBG_COURSE.M1P0T1
        M1P0_LBL2.text = VBG_COURSE.M1P0T2
        M1P0_LBL3.text = VBG_COURSE.M1P0T3
        M1P0_LBL4.text = VBG_COURSE.M1P0T4
        M1P0_LBL5.text = VBG_COURSE.M1P0T5
        M1P0_LBL6.text = VBG_COURSE.M1P0T6
        
        M1P0_IMG_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    @IBAction func previousPage(_ sender: UIButton) {
        vbgDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        vbgDelegate?.nextPage()
    }

}
