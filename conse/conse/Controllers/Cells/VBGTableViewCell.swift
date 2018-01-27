//
//  VBGTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class VBGTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    // Module 0 - Page 0
    @IBOutlet weak var M0P0_LBL1: UILabel!
    @IBOutlet weak var M0P0_LBL2: UILabel!
    @IBOutlet weak var M0P0_BTN1: UIButton!

    // Module 0 - Page 1
    @IBOutlet weak var M0P1_LBL1: UILabel!
    @IBOutlet weak var M0P1_LBL2: UILabel!
    @IBOutlet weak var M0P1_LBL3: UILabel!
    @IBOutlet weak var M0P1_LBL4: UILabel!
    @IBOutlet weak var M0P1_BTN1: UIButton!
    @IBOutlet weak var M0P1_BTN2: UIButton!
    @IBOutlet weak var M0P1_IMG1: UIImageView!
    
    // Module 1 - Page 0
    @IBOutlet weak var M1P0_LBL1: UILabel!
    @IBOutlet weak var M1P0_LBL2: UILabel!
    @IBOutlet weak var M1P0_LBL3: UILabel!
    @IBOutlet weak var M1P0_LBL4: UILabel!
    @IBOutlet weak var M1P0_LBL5: UILabel!
    @IBOutlet weak var M1P0_LBL6: UILabel!
    @IBOutlet weak var M1P0_IMG_AVATAR: UIImageView!
    @IBOutlet weak var M1P0_IMG_GLOBO: UIImageView!
    
    // Module 1 - Page 1
    @IBOutlet weak var M1P1_LBL1: UILabel!
    @IBOutlet weak var M1P1_LBL2: UILabel!
    @IBOutlet weak var M1P1_LBL3: UILabel!
    @IBOutlet weak var M1P1_LBL4: UILabel!
    @IBOutlet weak var M1P1_LBL5: UILabel!
    @IBOutlet weak var M1P1_LBL6: UILabel!
    @IBOutlet weak var M1P1_LBL7: UILabel!
    
   // Module 1 - Page 2
    @IBOutlet weak var M1P2_LBL1: UILabel!
    @IBOutlet weak var M1P2_LBL2: UILabel!
    @IBOutlet weak var M1P2_LBL3: UILabel!
    @IBOutlet weak var M1P2_LBL4: UILabel!
    @IBOutlet weak var M1P2_LBL5: UILabel!
    @IBOutlet weak var M1P2_LBL6: UILabel!
    @IBOutlet weak var M1P2_LBL7: UILabel!
    @IBOutlet weak var M1P2_AUD1: UIButton!
    @IBOutlet weak var M1P2_AUD2: UIButton!
    @IBOutlet weak var M1P2_AUD3: UIButton!
    @IBOutlet weak var M1P2_AUD4: UIButton!
    
    // Module 1 - Page 3
    @IBOutlet weak var M1P3_LBL1: UILabel!
    @IBOutlet weak var M1P3_LBL2: UILabel!
    @IBOutlet weak var M1P3_LBL3: UILabel!
    @IBOutlet weak var M1P3_LBL4: UILabel!
    @IBOutlet weak var M1P3_LBL5: UILabel!
    @IBOutlet weak var M1P3_LBL6: UILabel!
    @IBOutlet weak var M1P3_LBL7: UILabel!
    @IBOutlet weak var M1P3_LBL8: UILabel!
    @IBOutlet weak var M1P3_LBL9: UILabel!
    @IBOutlet weak var M1P3_LBL10: UILabel!
    @IBOutlet weak var M1P3_LBL11: UILabel!
    @IBOutlet weak var M1P3_LBL12: UILabel!
    @IBOutlet weak var M1P3_LBL13: UILabel!
    
    // Module 1 - Page 4
     @IBOutlet weak var M1P4_LBL1: UILabel!
     @IBOutlet weak var M1P4_LBL2: UILabel!
     @IBOutlet weak var M1P4_LBL3: UILabel!
    
    // Module 1 - Page 5
     @IBOutlet weak var M1P5_LBL1: UILabel!
     @IBOutlet weak var M1P5_LBL2: UILabel!
     @IBOutlet weak var M1P5_LBL3: UILabel!
     @IBOutlet weak var M1P5_LBL4: UILabel!
     @IBOutlet weak var M1P5_LBL5: UILabel!
     @IBOutlet weak var M1P5_LBL6: UILabel!
     @IBOutlet weak var M1P5_AUD1: UIButton!
     @IBOutlet weak var M1P5_AUD2: UIButton!
     @IBOutlet weak var M1P5_AUD3: UIButton!
     @IBOutlet weak var M1P5_AUD4: UIButton!
    
    // Module 1 - Page 6
     @IBOutlet weak var M1P6_LBL1: UILabel!
     @IBOutlet weak var M1P6_LBL2: UILabel!
     @IBOutlet weak var M1P6_AUD1: UIButton!
     @IBOutlet weak var M1P6_IMG_AVATAR: UIImageView!
    
    // Module 1 - Page 7
     @IBOutlet weak var M1P7_LBL1: UILabel!
     @IBOutlet weak var M1P7_LBL2: UILabel!
    
    // Module 1 - CROSSWORD
    @IBOutlet weak var M1_CROSSWORD_LBL1: UILabel!
    @IBOutlet weak var M1_CROSSWORD_BTN1: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN2: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN3: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN4: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN5: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN6: UIButton!
    @IBOutlet weak var M1_CROSSWORD_BTN_N: UIButton!
    
    // Name of textField cell for Crossword
    //(M1CW)Module 1 Crossword
    //(C_RC) Cell_RowCol ... (C0209 = Cell in Row 02, Col 09)
    @IBOutlet weak var M1CW_C_0209: UITextField!
    @IBOutlet weak var M1CW_C_0307: UITextField!
    @IBOutlet weak var M1CW_C_0308: UITextField!
    @IBOutlet weak var M1CW_C_0309: UITextField!
    @IBOutlet weak var M1CW_C_0310: UITextField!
    @IBOutlet weak var M1CW_C_0311: UITextField!
    @IBOutlet weak var M1CW_C_0312: UITextField!
    @IBOutlet weak var M1CW_C_0402: UITextField!
    @IBOutlet weak var M1CW_C_0409: UITextField!
    @IBOutlet weak var M1CW_C_0502: UITextField!
    @IBOutlet weak var M1CW_C_0503: UITextField!
    @IBOutlet weak var M1CW_C_0504: UITextField!
    @IBOutlet weak var M1CW_C_0505: UITextField!
    @IBOutlet weak var M1CW_C_0506: UITextField!
    @IBOutlet weak var M1CW_C_0507: UITextField!
    @IBOutlet weak var M1CW_C_0508: UITextField!
    @IBOutlet weak var M1CW_C_0509: UITextField!
    @IBOutlet weak var M1CW_C_0510: UITextField!
    @IBOutlet weak var M1CW_C_0602: UITextField!
    @IBOutlet weak var M1CW_C_0609: UITextField!
    @IBOutlet weak var M1CW_C_0702: UITextField!
    @IBOutlet weak var M1CW_C_0709: UITextField!
    @IBOutlet weak var M1CW_C_0802: UITextField!
    @IBOutlet weak var M1CW_C_0809: UITextField!
    @IBOutlet weak var M1CW_C_0902: UITextField!
    @IBOutlet weak var M1CW_C_0909: UITextField!
    @IBOutlet weak var M1CW_C_1006: UITextField!
    @IBOutlet weak var M1CW_C_1007: UITextField!
    @IBOutlet weak var M1CW_C_1008: UITextField!
    @IBOutlet weak var M1CW_C_1009: UITextField!
    @IBOutlet weak var M1CW_C_1010: UITextField!
    @IBOutlet weak var M1CW_C_1011: UITextField!
    @IBOutlet weak var M1CW_C_1012: UITextField!
    @IBOutlet weak var M1CW_C_1109: UITextField!
    @IBOutlet weak var M1CW_C_1206: UITextField!
    @IBOutlet weak var M1CW_C_1207: UITextField!
    @IBOutlet weak var M1CW_C_1208: UITextField!
    @IBOutlet weak var M1CW_C_1209: UITextField!
    @IBOutlet weak var M1CW_C_1210: UITextField!
    @IBOutlet weak var M1CW_C_1211: UITextField!
    
    @IBOutlet weak var M1COMPLET_T1: UILabel!
    @IBOutlet weak var M1COMPLET_TITLE: UILabel!
    @IBOutlet weak var M1COMPLET_MESSAGE: UILabel!
    @IBOutlet weak var M1BG_HEIGHT: NSLayoutConstraint!
    
    // Module 2
    @IBOutlet weak var VBG_13_LBL1: UILabel!
    @IBOutlet weak var VBG_13_LBL2: UILabel!
    @IBOutlet weak var VBG_13_LBL3: UILabel!
    @IBOutlet weak var VBG_13_LBL4: UILabel!
    @IBOutlet weak var VBG_13_AUD: UIButton!
    
    @IBOutlet weak var VBG_14_LBL1: UILabel!
    @IBOutlet weak var VBG_14_LBL2: UILabel!
    
    @IBOutlet weak var VBG_15_LBL1: UILabel!
    @IBOutlet weak var VBG_15_LBL2: UILabel!
    @IBOutlet weak var VBG_15_LBL3: UILabel!
    @IBOutlet weak var VBG_15_OPT_1: UILabel!
    @IBOutlet weak var VBG_15_OPT_2: UILabel!
    @IBOutlet weak var VBG_15_OPT_3: UILabel!
    @IBOutlet weak var VBG_15_OPT_4: UILabel!
    @IBOutlet weak var VBG_15_OPT_5: UILabel!
    @IBOutlet weak var VBG_15_BTN1: UIButton!
    @IBOutlet weak var VBG_15_BTN2: UIButton!
    @IBOutlet weak var VBG_15_BTN3: UIButton!
    @IBOutlet weak var VBG_15_BTN4: UIButton!
    @IBOutlet weak var VBG_15_BTN5: UIButton!
    
    @IBOutlet weak var VBG_16_LBL1: UILabel!
    @IBOutlet weak var VBG_16_LBL2: UILabel!
    @IBOutlet weak var VBG_16_LBL3: UILabel!
    @IBOutlet weak var VBG_16_HEIGHT: NSLayoutConstraint!
    
    
    // Module 3
    @IBOutlet weak var VBG_17_LBL1: UILabel!
    @IBOutlet weak var VBG_17_LBL2: UILabel!
    @IBOutlet weak var VBG_17_LBL3: UILabel!
    @IBOutlet weak var VBG_17_LBL4: UILabel!
    @IBOutlet weak var VBG_17_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_18_LBL1: UILabel!
    @IBOutlet weak var VBG_18_LBL2: UILabel!
    @IBOutlet weak var VBG_18_LBL3: UILabel!
    @IBOutlet weak var VBG_18_LBL4: UILabel!
    @IBOutlet weak var VBG_18_LBL5: UILabel!
    @IBOutlet weak var VBG_18_LBL6: UILabel!
    @IBOutlet weak var VBG_18_LBL7: UILabel!
    @IBOutlet weak var VBG_18_AUD: UIButton!
    
    @IBOutlet weak var VBG_19_LBL1: UILabel!
    
    @IBOutlet weak var VBG_20_LBL1: UILabel!
    @IBOutlet weak var VBG_20_LBL2: UILabel!
    @IBOutlet weak var VBG_20_LBL3: UILabel!
    @IBOutlet weak var VBG_20_LBL4: UILabel!
    @IBOutlet weak var VBG_20_AUD: UIButton!
    @IBOutlet weak var VBG_20_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_21_LBL1: UILabel!
    
    @IBOutlet weak var VBG_22_LBL1: UILabel!
    @IBOutlet weak var VBG_22_LBL2: UILabel!
    @IBOutlet weak var VBG_22_LBL3: UILabel!
    @IBOutlet weak var VBG_22_LBL4: UILabel!
    @IBOutlet weak var VBG_22_AUD: UIButton!
    @IBOutlet weak var VBG_22_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_23_LBL1: UILabel!
    
    @IBOutlet weak var VBG_24_LBL1: UILabel!
    @IBOutlet weak var VBG_24_LBL2: UILabel!
    @IBOutlet weak var VBG_24_LBL3: UILabel!
    @IBOutlet weak var VBG_24_LBL4: UILabel!
    @IBOutlet weak var VBG_24_AUD: UIButton!
    @IBOutlet weak var VBG_24_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_25_LBL1: UILabel!
    @IBOutlet weak var VBG_26_LBL1: UILabel!
    @IBOutlet weak var VBG_27_LBL1: UILabel!
    
    @IBOutlet weak var VBG_28_LBL1: UILabel!
    @IBOutlet weak var VBG_28_LBL2: UILabel!
    @IBOutlet weak var VBG_28_LBL3: UILabel!
    @IBOutlet weak var VBG_28_LBL4: UILabel!
    @IBOutlet weak var VBG_28_AUD: UIButton!
    @IBOutlet weak var VBG_28_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_29_LBL1: UILabel!
    
    @IBOutlet weak var VBG_30_LBL1: UILabel!
    @IBOutlet weak var VBG_30_LBL2: UILabel!
    
    @IBOutlet weak var VBG_31_LBL1: UILabel!
    @IBOutlet weak var VBG_31_LBL2: UILabel!
    @IBOutlet weak var VBG_31_LBL3: UILabel!
    @IBOutlet weak var VBG_31_OPT_1: UILabel!
    @IBOutlet weak var VBG_31_OPT_2: UILabel!
    @IBOutlet weak var VBG_31_OPT_3: UILabel!
    @IBOutlet weak var VBG_31_BTN1: UIButton!
    @IBOutlet weak var VBG_31_BTN2: UIButton!
    @IBOutlet weak var VBG_31_BTN3: UIButton!
    
    @IBOutlet weak var VBG_32_LBL1: UILabel!
    @IBOutlet weak var VBG_32_LBL2: UILabel!
    @IBOutlet weak var VBG_32_OPT_1: UILabel!
    @IBOutlet weak var VBG_32_OPT_2: UILabel!
    @IBOutlet weak var VBG_32_OPT_3: UILabel!
    @IBOutlet weak var VBG_32_OPT_4: UILabel!
    @IBOutlet weak var VBG_32_BTN1: UIButton!
    @IBOutlet weak var VBG_32_BTN2: UIButton!
    @IBOutlet weak var VBG_32_BTN3: UIButton!
    @IBOutlet weak var VBG_32_BTN4: UIButton!
    
    @IBOutlet weak var VBG_33_LBL1: UILabel!
    @IBOutlet weak var VBG_33_LBL2: UILabel!
    @IBOutlet weak var VBG_33_OPT_1: UILabel!
    @IBOutlet weak var VBG_33_OPT_2: UILabel!
    @IBOutlet weak var VBG_33_OPT_3: UILabel!
    @IBOutlet weak var VBG_33_BTN1: UIButton!
    @IBOutlet weak var VBG_33_BTN2: UIButton!
    @IBOutlet weak var VBG_33_BTN3: UIButton!
    
    @IBOutlet weak var VBG_34_LBL1: UILabel!
    @IBOutlet weak var VBG_34_LBL2: UILabel!
    @IBOutlet weak var VBG_34_OPT_1: UILabel!
    @IBOutlet weak var VBG_34_OPT_2: UILabel!
    @IBOutlet weak var VBG_34_OPT_3: UILabel!
    @IBOutlet weak var VBG_34_OPT_4: UILabel!
    @IBOutlet weak var VBG_34_BTN1: UIButton!
    @IBOutlet weak var VBG_34_BTN2: UIButton!
    @IBOutlet weak var VBG_34_BTN3: UIButton!
    @IBOutlet weak var VBG_34_BTN4: UIButton!
    
    @IBOutlet weak var VBG_35_LBL1: UILabel!
    @IBOutlet weak var VBG_35_LBL2: UILabel!
    @IBOutlet weak var VBG_35_LBL3: UILabel!
    @IBOutlet weak var VBG_35_HEIGHT: NSLayoutConstraint!
    
    // Module 4
    @IBOutlet weak var VBG_36_LBL1: UILabel!
    @IBOutlet weak var VBG_36_LBL2: UILabel!
    @IBOutlet weak var VBG_36_LBL3: UILabel!
    
    @IBOutlet weak var VBG_37_LBL1: UILabel!
    @IBOutlet weak var VBG_37_LBL2: UILabel!
    @IBOutlet weak var VBG_37_LBL3: UILabel!
    
    @IBOutlet weak var VBG_38_LBL1: UILabel!
    @IBOutlet weak var VBG_38_LBL2: UILabel!
    @IBOutlet weak var VBG_38_LBL3: UILabel!
    @IBOutlet weak var VBG_38_LBL4: UILabel!
    @IBOutlet weak var VBG_38_AUD: UIButton!
    
    @IBOutlet weak var VBG_39_LBL1: UILabel!
    @IBOutlet weak var VBG_39_LBL2: UILabel!
    @IBOutlet weak var VBG_39_LBL3: UILabel!
    @IBOutlet weak var VBG_39_LBL4: UILabel!
    @IBOutlet weak var VBG_39_LBL5: UILabel!
    @IBOutlet weak var VBG_39_LBL6: UILabel!
    @IBOutlet weak var VBG_39_AUD1: UIButton!
    @IBOutlet weak var VBG_39_AUD2: UIButton!
    @IBOutlet weak var VBG_39_AUD3: UIButton!
    
    @IBOutlet weak var VBG_40_LBL1: UILabel!
    @IBOutlet weak var VBG_40_LBL2: UILabel!
    @IBOutlet weak var VBG_40_LBL3: UILabel!
    @IBOutlet weak var VBG_40_AUD: UIButton!
    @IBOutlet weak var VBG_40_AVATAR: UIImageView!
    
    @IBOutlet weak var VBG_41_LBL1: UILabel!
    @IBOutlet weak var VBG_41_LBL2: UILabel!
    @IBOutlet weak var VBG_41_LBL3: UILabel!
    @IBOutlet weak var VBG_41_LBL4: UILabel!
    @IBOutlet weak var VBG_41_LBL5: UILabel!
    @IBOutlet weak var VBG_41_LBL6: UILabel!
    @IBOutlet weak var VBG_41_LBL7: UILabel!
    @IBOutlet weak var VBG_41_LBL8: UILabel!
    @IBOutlet weak var VBG_41_LBL9: UILabel!
    
    @IBOutlet weak var VBG_42_LBL1: UILabel!
    @IBOutlet weak var VBG_42_LBL2: UILabel!
    @IBOutlet weak var VBG_42_LBL3: UILabel!
    @IBOutlet weak var VBG_42_LBL4: UILabel!
    @IBOutlet weak var VBG_42_LBL5: UILabel!
    
    @IBOutlet weak var VBG_43_LBL1: UILabel!
    @IBOutlet weak var VBG_43_LBL2: UILabel!
    @IBOutlet weak var VBG_43_LBL3: UILabel!
    @IBOutlet weak var VBG_43_LBL4: UILabel!
    @IBOutlet weak var VBG_43_LBL5: UILabel!
    
    @IBOutlet weak var VBG_44_LBL1: UILabel!
    @IBOutlet weak var VBG_44_LBL2: UILabel!
    @IBOutlet weak var VBG_44_LBL3: UILabel!
    @IBOutlet weak var VBG_44_AUD: UIButton!
    
    @IBOutlet weak var VBG_45_LBL1: UILabel!
    @IBOutlet weak var VBG_45_LBL2: UILabel!
    
    @IBOutlet weak var VBG_46_LBL1: UILabel!
    
    // Q1
    @IBOutlet weak var VBG_47_LBL1: UILabel!
    @IBOutlet weak var VBG_47_LBL2: UILabel!
    @IBOutlet weak var VBG_47_LBL3: UILabel!
    @IBOutlet weak var VBG_47_OPT_1: UILabel!
    @IBOutlet weak var VBG_47_OPT_2: UILabel!
    @IBOutlet weak var VBG_47_OPT_3: UILabel!
    @IBOutlet weak var VBG_47_OPT_4: UILabel!
    @IBOutlet weak var VBG_47_BTN1: UIButton!
    @IBOutlet weak var VBG_47_BTN2: UIButton!
    @IBOutlet weak var VBG_47_BTN3: UIButton!
    @IBOutlet weak var VBG_47_BTN4: UIButton!
    
    // Q2
    @IBOutlet weak var VBG_48_LBL1: UILabel!
    @IBOutlet weak var VBG_48_LBL2: UILabel!
    @IBOutlet weak var VBG_48_OPT_1: UILabel!
    @IBOutlet weak var VBG_48_OPT_2: UILabel!
    @IBOutlet weak var VBG_48_OPT_3: UILabel!
    @IBOutlet weak var VBG_48_OPT_4: UILabel!
    @IBOutlet weak var VBG_48_BTN1: UIButton!
    @IBOutlet weak var VBG_48_BTN2: UIButton!
    @IBOutlet weak var VBG_48_BTN3: UIButton!
    @IBOutlet weak var VBG_48_BTN4: UIButton!
    
    // Q3
    @IBOutlet weak var VBG_49_LBL1: UILabel!
    @IBOutlet weak var VBG_49_LBL2: UILabel!
    @IBOutlet weak var VBG_49_INPUT: UITextField!
    
    // Q4
    @IBOutlet weak var VBG_50_LBL1: UILabel!
    @IBOutlet weak var VBG_50_LBL2: UILabel!
    @IBOutlet weak var VBG_50_OPT_1: UILabel!
    @IBOutlet weak var VBG_50_OPT_2: UILabel!
    @IBOutlet weak var VBG_50_OPT_3: UILabel!
    @IBOutlet weak var VBG_50_OPT_4: UILabel!
    @IBOutlet weak var VBG_50_BTN1: UIButton!
    @IBOutlet weak var VBG_50_BTN2: UIButton!
    @IBOutlet weak var VBG_50_BTN3: UIButton!
    @IBOutlet weak var VBG_50_BTN4: UIButton!
    
    // Q5
    @IBOutlet weak var VBG_51_LBL1: UILabel!
    @IBOutlet weak var VBG_51_LBL2: UILabel!
    @IBOutlet weak var VBG_51_OPT_1: UILabel!
    @IBOutlet weak var VBG_51_OPT_2: UILabel!
    @IBOutlet weak var VBG_51_OPT_3: UILabel!
    @IBOutlet weak var VBG_51_BTN1: UIButton!
    @IBOutlet weak var VBG_51_BTN2: UIButton!
    @IBOutlet weak var VBG_51_BTN3: UIButton!
    
    // Q6
    @IBOutlet weak var VBG_52_LBL1: UILabel!
    @IBOutlet weak var VBG_52_LBL2: UILabel!
    @IBOutlet weak var VBG_52_OPT_1: UILabel!
    @IBOutlet weak var VBG_52_OPT_2: UILabel!
    @IBOutlet weak var VBG_52_OPT_3: UILabel!
    @IBOutlet weak var VBG_52_BTN1: UIButton!
    @IBOutlet weak var VBG_52_BTN2: UIButton!
    @IBOutlet weak var VBG_52_BTN3: UIButton!
    
    // Q7
    @IBOutlet weak var VBG_53_LBL1: UILabel!
    @IBOutlet weak var VBG_53_LBL2: UILabel!
    @IBOutlet weak var VBG_53_OPT_1: UILabel!
    @IBOutlet weak var VBG_53_OPT_2: UILabel!
    @IBOutlet weak var VBG_53_OPT_3: UILabel!
    @IBOutlet weak var VBG_53_OPT_4: UILabel!
    @IBOutlet weak var VBG_53_BTN1: UIButton!
    @IBOutlet weak var VBG_53_BTN2: UIButton!
    @IBOutlet weak var VBG_53_BTN3: UIButton!
    @IBOutlet weak var VBG_53_BTN4: UIButton!
    
    // Q8
    @IBOutlet weak var VBG_54_LBL1: UILabel!
    @IBOutlet weak var VBG_54_LBL2: UILabel!
    @IBOutlet weak var VBG_54_OPT_1: UILabel!
    @IBOutlet weak var VBG_54_OPT_2: UILabel!
    @IBOutlet weak var VBG_54_OPT_3: UILabel!
    @IBOutlet weak var VBG_54_OPT_4: UILabel!
    @IBOutlet weak var VBG_54_BTN1: UIButton!
    @IBOutlet weak var VBG_54_BTN2: UIButton!
    @IBOutlet weak var VBG_54_BTN3: UIButton!
    @IBOutlet weak var VBG_54_BTN4: UIButton!
    
    @IBOutlet weak var VBG_55_LBL1: UILabel!
    @IBOutlet weak var VBG_55_LBL2: UILabel!
    @IBOutlet weak var VBG_55_LBL3: UILabel!
    @IBOutlet weak var VBG_55_HEIGHT: NSLayoutConstraint!
    
    // MARK: - Properties
    let MAX_LENGTH_CELL = 1
    let MIN_GLOBE_HEIGHT: CGFloat = 380
    let CORRECT_OPTION: Int = 1
    let WRONG_OPTION: Int = 0
    
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
    
    func fillM1P1() {
        M1P1_LBL1.text = VBG_COURSE.M1P1T1
        M1P1_LBL2.text = VBG_COURSE.M1P1T2
        M1P1_LBL3.text = VBG_COURSE.M1P1T3
        M1P1_LBL4.text = VBG_COURSE.M1P1T4
        M1P1_LBL5.text = VBG_COURSE.M1P1T5
        M1P1_LBL6.text = VBG_COURSE.M1P1T6
        M1P1_LBL7.text = VBG_COURSE.M1P1T7
    }
    
    func fillM1P2() {
        M1P2_AUD1.isSelected = false
        M1P2_AUD2.isSelected = false
        M1P2_AUD3.isSelected = false
        M1P2_AUD4.isSelected = false
        
        M1P2_LBL1.text = VBG_COURSE.M1P2T1
        M1P2_LBL2.text = VBG_COURSE.M1P2T2
        M1P2_LBL3.text = VBG_COURSE.M1P2T3
        M1P2_LBL4.text = VBG_COURSE.M1P2T4
        M1P2_LBL5.text = VBG_COURSE.M1P2T5
        M1P2_LBL6.text = VBG_COURSE.M1P2T6
        M1P2_LBL7.text = VBG_COURSE.M1P2T7
    }

    func fillM1P3() {
        M1P3_LBL1.text = VBG_COURSE.M1P3T1
        M1P3_LBL2.text = VBG_COURSE.M1P3T2
        M1P3_LBL3.text = VBG_COURSE.M1P3T3
        M1P3_LBL4.text = VBG_COURSE.M1P3T4
        M1P3_LBL5.text = VBG_COURSE.M1P3T5
        M1P3_LBL6.text = VBG_COURSE.M1P3T6
        M1P3_LBL7.text = VBG_COURSE.M1P3T7
        M1P3_LBL8.text = VBG_COURSE.M1P3T8
        M1P3_LBL9.text = VBG_COURSE.M1P3T9
        M1P3_LBL10.text = VBG_COURSE.M1P3T10
        M1P3_LBL11.text = VBG_COURSE.M1P3T11
        M1P3_LBL12.text = VBG_COURSE.M1P3T12
        M1P3_LBL13.text = VBG_COURSE.M1P3T13
    }
    
    func fillM1P4() {
        M1P4_LBL1.text = VBG_COURSE.M1P3T1
        M1P4_LBL2.text = VBG_COURSE.M1P3T2
        M1P4_LBL3.text = VBG_COURSE.M1P3T3
    }
    
    func fillM1P5() {
        M1P5_AUD1.isSelected = false
        M1P5_AUD2.isSelected = false
        M1P5_AUD3.isSelected = false
        M1P5_AUD4.isSelected = false
     
        M1P5_LBL1.text = VBG_COURSE.M1P5T1
        M1P5_LBL2.text = VBG_COURSE.M1P5T2
        M1P5_LBL3.text = VBG_COURSE.M1P5T3
        M1P5_LBL4.text = VBG_COURSE.M1P5T4
        M1P5_LBL5.text = VBG_COURSE.M1P5T5
        M1P5_LBL6.text = VBG_COURSE.M1P5T6
    }
    
    func fillM1P6() {
        M1P6_AUD1.isSelected = false
     
        M1P6_LBL1.text = VBG_COURSE.M1P6T1
        M1P6_LBL2.text = VBG_COURSE.M1P6T2
        M1P6_IMG_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fillM1P7() {
        M1P7_LBL1.text = VBG_COURSE.M1P7T1
        M1P7_LBL2.text = VBG_COURSE.M1P7T2
    }

    func fill_CROSSWORD() {
        M1_CROSSWORD_LBL1.text = VBG_COURSE.M1CWT1
        M1CW_C_0209.text = nullString; M1CW_C_0307.text = nullString; M1CW_C_0308.text = nullString; M1CW_C_0309.text = nullString
        M1CW_C_0310.text = nullString; M1CW_C_0311.text = nullString; M1CW_C_0312.text = nullString; M1CW_C_0402.text = nullString
        M1CW_C_0409.text = nullString; M1CW_C_0502.text = nullString; M1CW_C_0503.text = nullString; M1CW_C_0504.text = nullString
        M1CW_C_0505.text = nullString; M1CW_C_0506.text = nullString; M1CW_C_0507.text = nullString; M1CW_C_0508.text = nullString
        M1CW_C_0509.text = nullString; M1CW_C_0510.text = nullString; M1CW_C_0602.text = nullString; M1CW_C_0609.text = nullString
        M1CW_C_0702.text = nullString; M1CW_C_0709.text = nullString; M1CW_C_0802.text = nullString; M1CW_C_0809.text = nullString
        M1CW_C_0902.text = nullString; M1CW_C_0909.text = nullString; M1CW_C_1006.text = nullString; M1CW_C_1007.text = nullString
        M1CW_C_1008.text = nullString; M1CW_C_1009.text = nullString; M1CW_C_1010.text = nullString; M1CW_C_1011.text = nullString
        M1CW_C_1012.text = nullString; M1CW_C_1109.text = nullString; M1CW_C_1206.text = nullString; M1CW_C_1207.text = nullString
        M1CW_C_1208.text = nullString; M1CW_C_1209.text = nullString; M1CW_C_1210.text = nullString; M1CW_C_1211.text = nullString
        
        // Set Delegates
        M1CW_C_0209.delegate = self; M1CW_C_0307.delegate = self; M1CW_C_0308.delegate = self; M1CW_C_0309.delegate = self
        M1CW_C_0310.delegate = self; M1CW_C_0311.delegate = self; M1CW_C_0312.delegate = self; M1CW_C_0402.delegate = self
        M1CW_C_0409.delegate = self; M1CW_C_0502.delegate = self; M1CW_C_0503.delegate = self; M1CW_C_0504.delegate = self
        M1CW_C_0505.delegate = self; M1CW_C_0506.delegate = self; M1CW_C_0507.delegate = self; M1CW_C_0508.delegate = self
        M1CW_C_0509.delegate = self; M1CW_C_0510.delegate = self; M1CW_C_0602.delegate = self; M1CW_C_0609.delegate = self
        M1CW_C_0702.delegate = self; M1CW_C_0709.delegate = self; M1CW_C_0802.delegate = self; M1CW_C_0809.delegate = self
        M1CW_C_0902.delegate = self; M1CW_C_0909.delegate = self; M1CW_C_1006.delegate = self; M1CW_C_1007.delegate = self
        M1CW_C_1008.delegate = self; M1CW_C_1009.delegate = self; M1CW_C_1010.delegate = self; M1CW_C_1011.delegate = self
        M1CW_C_1012.delegate = self; M1CW_C_1109.delegate = self; M1CW_C_1206.delegate = self; M1CW_C_1207.delegate = self
        M1CW_C_1208.delegate = self; M1CW_C_1209.delegate = self; M1CW_C_1210.delegate = self; M1CW_C_1211.delegate = self
    }
    
    func fill_GLOBE_M1(height: CGFloat){
        M1BG_HEIGHT.constant = height > MIN_GLOBE_HEIGHT ? height : MIN_GLOBE_HEIGHT
        M1COMPLET_T1.text = VBG_COURSE.M1P1T1
        M1COMPLET_TITLE.text = VBG_COURSE.COMPLETE_MOD1_TITLE
        M1COMPLET_MESSAGE.text = VBG_COURSE.COMPLETE_MOD1_MESSAGE
    }
    
    func fill_VBG_13() {
        VBG_13_LBL1.text = VBG_COURSE.VBG_13_T1
        VBG_13_LBL2.text = VBG_COURSE.VBG_13_T2
        VBG_13_LBL3.text = VBG_COURSE.VBG_13_T3
        VBG_13_LBL4.text = VBG_COURSE.VBG_13_T4
    }
    
    func fill_VBG_14() {
        VBG_14_LBL1.text = VBG_COURSE.VBG_14_T1
        VBG_14_LBL2.text = VBG_COURSE.VBG_14_T2
    }
    
    func fill_VBG_15() {
        VBG_15_LBL1.text = VBG_COURSE.VBG_15_T1
        VBG_15_LBL2.text = VBG_COURSE.VBG_15_T2
        VBG_15_LBL3.text = VBG_COURSE.VBG_15_T3
        VBG_15_OPT_1.text = VBG_COURSE.VBG_15_OPT1
        VBG_15_OPT_2.text = VBG_COURSE.VBG_15_OPT2
        VBG_15_OPT_3.text = VBG_COURSE.VBG_15_OPT3
        VBG_15_OPT_4.text = VBG_COURSE.VBG_15_OPT4
        VBG_15_OPT_5.text = VBG_COURSE.VBG_15_OPT5
        
        // set tag for identify correct option
        VBG_15_BTN1.tag = CORRECT_OPTION
        VBG_15_BTN2.tag = CORRECT_OPTION
        VBG_15_BTN3.tag = CORRECT_OPTION
        VBG_15_BTN4.tag = CORRECT_OPTION
        VBG_15_BTN5.tag = WRONG_OPTION
    }
    
    func fill_VBG_16(height: CGFloat) {
        VBG_16_HEIGHT.constant = height > MIN_GLOBE_HEIGHT ? height : MIN_GLOBE_HEIGHT
        VBG_16_LBL1.text = VBG_COURSE.VBG_16_T1
        VBG_16_LBL2.text = VBG_COURSE.VBG_16_T2
        VBG_16_LBL3.text = VBG_COURSE.VBG_16_T3
    }
    
    // Modulo 3
    func fill_VBG_17() {
        VBG_17_LBL1.text = VBG_COURSE.VBG_17_T1
        VBG_17_LBL2.text = VBG_COURSE.VBG_17_T2
        VBG_17_LBL3.text = VBG_COURSE.VBG_17_T3
        VBG_17_LBL4.text = VBG_COURSE.VBG_17_T4
        VBG_17_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_18() {
        VBG_18_LBL1.text = VBG_COURSE.VBG_18_T1
        VBG_18_LBL2.text = VBG_COURSE.VBG_18_T2
        VBG_18_LBL3.text = VBG_COURSE.VBG_18_T3
        VBG_18_LBL4.text = VBG_COURSE.VBG_18_T4
        VBG_18_LBL5.text = VBG_COURSE.VBG_18_T5
        VBG_18_LBL6.text = VBG_COURSE.VBG_18_T6
        VBG_18_LBL7.text = VBG_COURSE.VBG_18_T7
    }
    
    func fill_VBG_19() {
        VBG_19_LBL1.text = VBG_COURSE.VBG_19_T1
    }
    
    func fill_VBG_20() {
        VBG_20_LBL1.text = VBG_COURSE.VBG_20_T1
        VBG_20_LBL2.text = VBG_COURSE.VBG_20_T2
        VBG_20_LBL3.text = VBG_COURSE.VBG_20_T3
        VBG_20_LBL4.text = VBG_COURSE.VBG_20_T4
        VBG_20_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_21() {
        VBG_21_LBL1.text = VBG_COURSE.VBG_21_T1
    }
    
    func fill_VBG_22() {
        VBG_22_LBL1.text = VBG_COURSE.VBG_22_T1
        VBG_22_LBL2.text = VBG_COURSE.VBG_22_T2
        VBG_22_LBL3.text = VBG_COURSE.VBG_22_T3
        VBG_22_LBL4.text = VBG_COURSE.VBG_22_T4
        VBG_22_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_23() {
        VBG_23_LBL1.text = VBG_COURSE.VBG_23_T1
    }
    
    func fill_VBG_24() {
        VBG_24_LBL1.text = VBG_COURSE.VBG_24_T1
        VBG_24_LBL2.text = VBG_COURSE.VBG_24_T2
        VBG_24_LBL3.text = VBG_COURSE.VBG_24_T3
        VBG_24_LBL4.text = VBG_COURSE.VBG_24_T4
        VBG_24_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_25() {
        VBG_25_LBL1.text = VBG_COURSE.VBG_25_T1
    }
    
    func fill_VBG_26() {
        VBG_26_LBL1.text = VBG_COURSE.VBG_26_T1
    }
    
    func fill_VBG_27() {
        VBG_26_LBL1.text = VBG_COURSE.VBG_27_T1
    }
    
    func fill_VBG_28() {
        VBG_28_LBL1.text = VBG_COURSE.VBG_28_T1
        VBG_28_LBL2.text = VBG_COURSE.VBG_28_T2
        VBG_28_LBL3.text = VBG_COURSE.VBG_28_T3
        VBG_28_LBL4.text = VBG_COURSE.VBG_28_T4
        VBG_28_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_29() {
        VBG_29_LBL1.text = VBG_COURSE.VBG_29_T1
    }
    
    func fill_VBG_30() {
        VBG_30_LBL1.text = VBG_COURSE.VBG_30_T1
        VBG_30_LBL2.text = VBG_COURSE.VBG_30_T2
    }
    
    func fill_VBG_31() {
        VBG_31_LBL1.text = VBG_COURSE.VBG_31_T1
        VBG_31_LBL2.text = VBG_COURSE.VBG_31_T2
        VBG_31_LBL3.text = VBG_COURSE.VBG_31_T3
        VBG_31_OPT_1.text = VBG_COURSE.VBG_31_OPT1
        VBG_31_OPT_2.text = VBG_COURSE.VBG_31_OPT2
        VBG_31_OPT_3.text = VBG_COURSE.VBG_31_OPT3
        
        // set tag for identify correct option
        VBG_31_BTN1.tag = CORRECT_OPTION
        VBG_31_BTN2.tag = CORRECT_OPTION
        VBG_31_BTN3.tag = CORRECT_OPTION
    }
    
    func fill_VBG_32() {
        VBG_32_LBL1.text = VBG_COURSE.VBG_32_T1
        VBG_32_LBL2.text = VBG_COURSE.VBG_32_T2
        VBG_32_OPT_1.text = VBG_COURSE.VBG_32_OPT1
        VBG_32_OPT_2.text = VBG_COURSE.VBG_32_OPT2
        VBG_32_OPT_3.text = VBG_COURSE.VBG_32_OPT3
        VBG_32_OPT_4.text = VBG_COURSE.VBG_32_OPT4
        
        // set tag for identify correct option
        VBG_32_BTN1.tag = CORRECT_OPTION
        VBG_32_BTN2.tag = CORRECT_OPTION
        VBG_32_BTN3.tag = CORRECT_OPTION
        VBG_32_BTN4.tag = CORRECT_OPTION
    }
    
    func fill_VBG_33() {
        VBG_33_LBL1.text = VBG_COURSE.VBG_33_T1
        VBG_33_LBL2.text = VBG_COURSE.VBG_33_T2
        VBG_33_OPT_1.text = VBG_COURSE.VBG_33_OPT1
        VBG_33_OPT_2.text = VBG_COURSE.VBG_33_OPT2
        VBG_33_OPT_3.text = VBG_COURSE.VBG_33_OPT3
        
        // set tag for identify correct option
        VBG_33_BTN1.tag = CORRECT_OPTION
        VBG_33_BTN2.tag = CORRECT_OPTION
        VBG_33_BTN3.tag = CORRECT_OPTION
    }
    
    func fill_VBG_34() {
        VBG_34_LBL1.text = VBG_COURSE.VBG_34_T1
        VBG_34_LBL2.text = VBG_COURSE.VBG_34_T2
        VBG_34_OPT_1.text = VBG_COURSE.VBG_34_OPT1
        VBG_34_OPT_2.text = VBG_COURSE.VBG_34_OPT2
        VBG_34_OPT_3.text = VBG_COURSE.VBG_34_OPT3
        VBG_34_OPT_4.text = VBG_COURSE.VBG_34_OPT4
        
        // set tag for identify correct option
        VBG_34_BTN1.tag = CORRECT_OPTION
        VBG_34_BTN2.tag = CORRECT_OPTION
        VBG_34_BTN3.tag = CORRECT_OPTION
        VBG_34_BTN4.tag = CORRECT_OPTION
    }
    
    func fill_VBG_35(height: CGFloat) {
        VBG_35_HEIGHT.constant = height > MIN_GLOBE_HEIGHT ? height : MIN_GLOBE_HEIGHT
        VBG_35_LBL1.text = VBG_COURSE.VBG_35_T1
        VBG_35_LBL2.text = VBG_COURSE.VBG_35_T2
        VBG_35_LBL3.text = VBG_COURSE.VBG_35_T3
    }
    
    // Modulo 4
    func fill_VBG_36() {
        VBG_36_LBL1.text = VBG_COURSE.VBG_36_T1
        VBG_36_LBL2.text = VBG_COURSE.VBG_36_T2
        VBG_36_LBL3.text = VBG_COURSE.VBG_36_T3
    }
    
    func fill_VBG_37() {
        VBG_37_LBL1.text = VBG_COURSE.VBG_37_T1
        VBG_37_LBL2.text = VBG_COURSE.VBG_37_T2
        VBG_37_LBL3.text = VBG_COURSE.VBG_37_T3
    }
    
    func fill_VBG_38() {
        VBG_38_LBL1.text = VBG_COURSE.VBG_38_T1
        VBG_38_LBL2.text = VBG_COURSE.VBG_38_T2
        VBG_38_LBL3.text = VBG_COURSE.VBG_38_T3
        VBG_38_LBL4.text = VBG_COURSE.VBG_38_T4
    }
    
    func fill_VBG_39() {
        VBG_39_LBL1.text = VBG_COURSE.VBG_39_T1
        VBG_39_LBL2.text = VBG_COURSE.VBG_39_T2
        VBG_39_LBL3.text = VBG_COURSE.VBG_39_T3
        VBG_39_LBL4.text = VBG_COURSE.VBG_39_T4
        VBG_39_LBL5.text = VBG_COURSE.VBG_39_T5
        VBG_39_LBL6.text = VBG_COURSE.VBG_39_T6
    }
    
    func fill_VBG_40() {
        VBG_40_LBL1.text = VBG_COURSE.VBG_40_T1
        VBG_40_LBL2.text = VBG_COURSE.VBG_40_T2
        VBG_40_LBL3.text = VBG_COURSE.VBG_40_T3
        VBG_40_AVATAR.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_41() {
        VBG_41_LBL1.text = VBG_COURSE.VBG_41_T1
        VBG_41_LBL2.text = VBG_COURSE.VBG_41_T2
        VBG_41_LBL3.text = VBG_COURSE.VBG_41_T3
        VBG_41_LBL4.text = VBG_COURSE.VBG_41_T4
        VBG_41_LBL5.text = VBG_COURSE.VBG_41_T5
        VBG_41_LBL6.text = VBG_COURSE.VBG_41_T6
        VBG_41_LBL7.text = VBG_COURSE.VBG_41_T7
        VBG_41_LBL8.text = VBG_COURSE.VBG_41_T8
        VBG_41_LBL9.text = VBG_COURSE.VBG_41_T9
    }
    
    func fill_VBG_42() {
        VBG_42_LBL1.text = VBG_COURSE.VBG_42_T1
        VBG_42_LBL2.text = VBG_COURSE.VBG_42_T2
        VBG_42_LBL3.text = VBG_COURSE.VBG_42_T3
        VBG_42_LBL4.text = VBG_COURSE.VBG_42_T4
        VBG_42_LBL5.text = VBG_COURSE.VBG_42_T5
    }
    
    func fill_VBG_43() {
        VBG_43_LBL1.text = VBG_COURSE.VBG_43_T1
        VBG_43_LBL2.attributedText = addBoldWord(forText: VBG_COURSE.VBG_43_T2, toWord: VBG_COURSE.VBG_43_T2_inBOLD, fontSize: VBG_43_LBL2.font.pointSize)
        VBG_43_LBL3.attributedText = addBoldWord(forText: VBG_COURSE.VBG_43_T3, toWord: VBG_COURSE.VBG_43_T3_inBOLD, fontSize: VBG_43_LBL3.font.pointSize)
        VBG_43_LBL4.attributedText = addBoldWord(forText: VBG_COURSE.VBG_43_T4, toWord: VBG_COURSE.VBG_43_T4_inBOLD, fontSize: VBG_43_LBL4.font.pointSize)
        VBG_43_LBL5.attributedText = addBoldWord(forText: VBG_COURSE.VBG_43_T5, toWord: VBG_COURSE.VBG_43_T5_inBOLD, fontSize: VBG_43_LBL5.font.pointSize)
    }
    
    func fill_VBG_44() {
        VBG_44_LBL1.text = VBG_COURSE.VBG_44_T1
        VBG_44_LBL2.text = VBG_COURSE.VBG_44_T2
        VBG_44_LBL3.text = VBG_COURSE.VBG_44_T3
    }
    
    func fill_VBG_45() {
        VBG_45_LBL1.text = VBG_COURSE.VBG_45_T1
        VBG_45_LBL2.text = VBG_COURSE.VBG_45_T2
    }
    
    func fill_VBG_46() {
        VBG_46_LBL1.text = VBG_COURSE.VBG_46_T1
    }
    
    func fill_VBG_47() {
        VBG_47_LBL1.text = VBG_COURSE.VBG_47_T1
        VBG_47_LBL2.text = VBG_COURSE.VBG_47_T2
        VBG_47_LBL3.text = VBG_COURSE.VBG_47_T3
        VBG_47_OPT_1.text = VBG_COURSE.VBG_47_OPT1
        VBG_47_OPT_2.text = VBG_COURSE.VBG_47_OPT2
        VBG_47_OPT_3.text = VBG_COURSE.VBG_47_OPT3
        VBG_47_OPT_4.text = VBG_COURSE.VBG_47_OPT4

    }
    
    func fill_VBG_48() {
        VBG_48_LBL1.text = VBG_COURSE.VBG_48_T1
        VBG_48_LBL2.text = VBG_COURSE.VBG_48_T2
        VBG_48_OPT_1.text = VBG_COURSE.VBG_48_OPT1
        VBG_48_OPT_2.text = VBG_COURSE.VBG_48_OPT2
        VBG_48_OPT_3.text = VBG_COURSE.VBG_48_OPT3
        VBG_48_OPT_4.text = VBG_COURSE.VBG_48_OPT4
    }
    
    func fill_VBG_49() {
        VBG_49_LBL1.text = VBG_COURSE.VBG_49_T1
        VBG_49_LBL2.text = VBG_COURSE.VBG_49_T2
        VBG_49_INPUT.text = nullString
    }
    
    func fill_VBG_50() {
        VBG_50_LBL1.text = VBG_COURSE.VBG_50_T1
        VBG_50_LBL2.text = VBG_COURSE.VBG_50_T2
        VBG_50_OPT_1.text = VBG_COURSE.VBG_50_OPT1
        VBG_50_OPT_2.text = VBG_COURSE.VBG_50_OPT2
        VBG_50_OPT_3.text = VBG_COURSE.VBG_50_OPT3
        VBG_50_OPT_4.text = VBG_COURSE.VBG_50_OPT4
    }
    
    func fill_VBG_51() {
        VBG_51_LBL1.text = VBG_COURSE.VBG_51_T1
        VBG_51_LBL2.text = VBG_COURSE.VBG_51_T2
        VBG_51_OPT_1.text = VBG_COURSE.VBG_51_OPT1
        VBG_51_OPT_2.text = VBG_COURSE.VBG_51_OPT2
        VBG_51_OPT_3.text = VBG_COURSE.VBG_51_OPT3
    }
    
    func fill_VBG_52() {
        VBG_52_LBL1.text = VBG_COURSE.VBG_52_T1
        VBG_52_LBL2.text = VBG_COURSE.VBG_52_T2
        VBG_52_OPT_1.text = VBG_COURSE.VBG_52_OPT1
        VBG_52_OPT_2.text = VBG_COURSE.VBG_52_OPT2
        VBG_52_OPT_3.text = VBG_COURSE.VBG_52_OPT3
    }
    
    func fill_VBG_53() {
        VBG_53_LBL1.text = VBG_COURSE.VBG_53_T1
        VBG_53_LBL2.text = VBG_COURSE.VBG_53_T2
        VBG_53_OPT_1.text = VBG_COURSE.VBG_53_OPT1
        VBG_53_OPT_2.text = VBG_COURSE.VBG_53_OPT2
        VBG_53_OPT_3.text = VBG_COURSE.VBG_53_OPT3
        VBG_53_OPT_4.text = VBG_COURSE.VBG_53_OPT4
    }
    
    func fill_VBG_54() {
        VBG_54_LBL1.text = VBG_COURSE.VBG_54_T1
        VBG_54_LBL2.text = VBG_COURSE.VBG_54_T2
        VBG_54_OPT_1.text = VBG_COURSE.VBG_54_OPT1
        VBG_54_OPT_2.text = VBG_COURSE.VBG_54_OPT2
        VBG_54_OPT_3.text = VBG_COURSE.VBG_54_OPT3
        VBG_54_OPT_4.text = VBG_COURSE.VBG_54_OPT4
    }
    
    func fill_VBG_55(height: CGFloat) {
        VBG_55_HEIGHT.constant = height > MIN_GLOBE_HEIGHT ? height : MIN_GLOBE_HEIGHT
        VBG_55_LBL1.text = VBG_COURSE.VBG_55_T1
        VBG_55_LBL2.text = VBG_COURSE.VBG_55_T2
        VBG_55_LBL3.text = VBG_COURSE.VBG_55_T3
    }
    
    // MARK: - Acciones de navegación
    @IBAction func previousPage(_ sender: UIButton) {
        vbgDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        vbgDelegate?.nextPage()
    }
    
    @IBAction func changeButtonState (_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // Cambia el estado del boton que este reproduciendo el audio y actualiza los demás
    private func updateButtonsState(sender: UIButton, buttons: [UIButton]) {
        if sender.isSelected {
            for button in buttons {
                if button != sender {
                    button.isSelected = false
                }
            }
        }
    }
    
    /// Verifica que el boton de opcion este seleccionado, si esta marcado como respuesta correcta, o deseleccionado en caso contrario
    private func checkingQuestionary(options: UIButton...) -> Bool {
        
        for option in options {
            
            if option.tag == CORRECT_OPTION {
                guard option.isSelected else { return false }
            }
            else {
                guard !option.isSelected else { return false }
            }
            
        }
        
        return true
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        switch sender {
            
        case VBG_13_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_10, play: sender.isSelected)
            break
            
        case VBG_18_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_11, play: sender.isSelected)
            break
            
        case VBG_20_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_12, play: sender.isSelected)
            break
            
        case VBG_22_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_13, play: sender.isSelected)
            break
            
        case VBG_24_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_14, play: sender.isSelected)
            break
            
        case VBG_28_AUD:
            vbgDelegate?.audioManager(audioID: .AUD_11, play: sender.isSelected)
            break
            
        default:
            break
        }
    }
    
    // MARK: - Module 1 Functions
    // Reproduce o pausa los audios de "Ambitos"
    @IBAction func playPauseAudio(_ sender: UIButton) {
        
        switch sender {
        
        case M1P2_AUD1:
            vbgDelegate?.audioManager(audioID: .AUD_1, play: !M1P2_AUD1.isSelected)
            M1P2_AUD1.isSelected = !M1P2_AUD1.isSelected
            break
            
        case M1P2_AUD2:
            vbgDelegate?.audioManager(audioID: .AUD_2, play: !M1P2_AUD2.isSelected)
            M1P2_AUD2.isSelected = !M1P2_AUD2.isSelected
            break
            
        case M1P2_AUD3:
            vbgDelegate?.audioManager(audioID: .AUD_3, play: !M1P2_AUD3.isSelected)
            M1P2_AUD3.isSelected = !M1P2_AUD3.isSelected
            break
       
        default:
            vbgDelegate?.audioManager(audioID: .AUD_4, play: !M1P2_AUD4.isSelected)
            M1P2_AUD4.isSelected = !M1P2_AUD4.isSelected
            break
        }
        
        updateButtonsState(sender: sender, buttons: [M1P2_AUD1, M1P2_AUD2, M1P2_AUD3, M1P2_AUD4])
    }
    
    // Reproduce o pausa los audios de "Tipos de Violencia"
    @IBAction func playViolenceType(_ sender: UIButton) {
        
        switch sender {
            
        case M1P5_AUD1:
            vbgDelegate?.audioManager(audioID: .AUD_5, play: !M1P5_AUD1.isSelected)
            M1P5_AUD1.isSelected = !M1P5_AUD1.isSelected
            break
            
        case M1P5_AUD2:
            vbgDelegate?.audioManager(audioID: .AUD_6, play: !M1P5_AUD2.isSelected)
            M1P5_AUD2.isSelected = !M1P5_AUD2.isSelected
            break
            
        case M1P5_AUD3:
            vbgDelegate?.audioManager(audioID: .AUD_7, play: !M1P5_AUD3.isSelected)
            M1P5_AUD3.isSelected = !M1P5_AUD3.isSelected
            break
            
        default:
            vbgDelegate?.audioManager(audioID: .AUD_8, play: !M1P5_AUD4.isSelected)
            M1P5_AUD4.isSelected = !M1P5_AUD4.isSelected
            break
        }
        
        updateButtonsState(sender: sender, buttons: [M1P5_AUD1, M1P5_AUD2, M1P5_AUD3, M1P5_AUD4])
    }
    
    // Reproduce o pausa el audio de "Nunca olvides..."
    @IBAction func playNeverForget(_ sender: UIButton) {
        vbgDelegate?.audioManager(audioID: .AUD_9, play: !M1P6_AUD1.isSelected)
        M1P6_AUD1.isSelected = !M1P6_AUD1.isSelected
    }
    
    // MARK: Crossword functions
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count == MAX_LENGTH_CELL {
            if let nextField = getNextTextField(forTextField: textField.tag) {
                nextField.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
    
    private func getNextTextField(forTextField tag: Int) -> UITextField! {
        
        M1CW_C_0309.tag = M1CW_C_0308.tag == tag ? 23 : 2
        M1CW_C_0502.tag = M1CW_C_0402.tag == tag ? 32 : 41
        M1CW_C_0509.tag = M1CW_C_0508.tag == tag ? 48 : 4
        M1CW_C_1009.tag = M1CW_C_1008.tag == tag ? 54 : 9
        M1CW_C_1209.tag = M1CW_C_1208.tag == tag ? 64 : 11
        
        let cw_cells = [M1CW_C_0209, M1CW_C_0307, M1CW_C_0308, M1CW_C_0309,
                        M1CW_C_0310, M1CW_C_0311, M1CW_C_0312, M1CW_C_0402,
                        M1CW_C_0409, M1CW_C_0502, M1CW_C_0503, M1CW_C_0504,
                        M1CW_C_0505, M1CW_C_0506, M1CW_C_0507, M1CW_C_0508,
                        M1CW_C_0509, M1CW_C_0510, M1CW_C_0602, M1CW_C_0609,
                        M1CW_C_0702, M1CW_C_0709, M1CW_C_0802, M1CW_C_0809,
                        M1CW_C_0902, M1CW_C_0909, M1CW_C_1006, M1CW_C_1007,
                        M1CW_C_1008, M1CW_C_1009, M1CW_C_1010, M1CW_C_1011,
                        M1CW_C_1012, M1CW_C_1109, M1CW_C_1206, M1CW_C_1207,
                        M1CW_C_1208, M1CW_C_1209, M1CW_C_1210, M1CW_C_1211]
        
        for cell in cw_cells {
            if cell?.tag == (tag + 1) {
                return cell
            }
        }
        
        return nil
    }
    
    // Muestra ayuda
    @IBAction func showHelp(_ sender: UIButton) {
        
        switch sender {
            
        case M1_CROSSWORD_BTN1:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN1.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_1)
            break
            
        case M1_CROSSWORD_BTN2:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN2.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_2)
            break
            
        case M1_CROSSWORD_BTN3:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN3.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_3)
            break
            
        case M1_CROSSWORD_BTN4:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN4.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_4)
            break
            
        case M1_CROSSWORD_BTN5:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN5.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_5)
            break
            
        default:
            vbgDelegate?.showPopupHelp(title: (M1_CROSSWORD_BTN6.titleLabel?.text)!, text: VGB_CROSSWORD.HELP_6)
            break
        }
    }
    
    // Valida las respuestas
    @IBAction func checkCrossword(_ sender: UIButton) {
        
        guard validateCrossword(word: M1CW_C_0209, M1CW_C_0309, M1CW_C_0409, M1CW_C_0509, M1CW_C_0609, M1CW_C_0709, M1CW_C_0809, M1CW_C_0909, M1CW_C_1009, M1CW_C_1109, M1CW_C_1209, option: 1)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        guard validateCrossword(word: M1CW_C_0307, M1CW_C_0308, M1CW_C_0309, M1CW_C_0310, M1CW_C_0311, M1CW_C_0312, option: 2)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        guard validateCrossword(word: M1CW_C_0402, M1CW_C_0502, M1CW_C_0602, M1CW_C_0702, M1CW_C_0802, M1CW_C_0902, option: 3)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        guard validateCrossword(word: M1CW_C_0502, M1CW_C_0503, M1CW_C_0504, M1CW_C_0505, M1CW_C_0506, M1CW_C_0507, M1CW_C_0508, M1CW_C_0509, M1CW_C_0510, option: 4)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        guard validateCrossword(word: M1CW_C_1006, M1CW_C_1007, M1CW_C_1008, M1CW_C_1009, M1CW_C_1010, M1CW_C_1011, M1CW_C_1012, option: 5)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        guard validateCrossword(word: M1CW_C_1206, M1CW_C_1207, M1CW_C_1208, M1CW_C_1209, M1CW_C_1210, M1CW_C_1211, option: 6)
            else {
                vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD1, inbold: nil, type: .failed)
                return
        }
        
        nextPage(M1_CROSSWORD_BTN_N)
    }
    
    // MARK: Module 2 Functions
    @IBAction func checkModule2Test(_ sender: UIButton) {
        checkingQuestionary(options: VBG_15_BTN1, VBG_15_BTN2, VBG_15_BTN3, VBG_15_BTN4, VBG_15_BTN5) ? nextPage(M1_CROSSWORD_BTN_N) : vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD2, inbold: nil, type: .failed)
    }
    
    // MARK: Module 3 Functions
    @IBAction func checkModule3Question1(_ sender: UIButton) {
        checkingQuestionary(options: VBG_31_BTN1, VBG_31_BTN2, VBG_31_BTN3) ? nextPage(M1_CROSSWORD_BTN_N) : vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD3_Q1, inbold: nil, type: .failed)
    }
    
    @IBAction func checkModule3Question2(_ sender: UIButton) {
        checkingQuestionary(options: VBG_32_BTN1, VBG_32_BTN2, VBG_32_BTN3, VBG_32_BTN4) ? nextPage(M1_CROSSWORD_BTN_N) : vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD3_Q2, inbold: nil, type: .failed)
    }
    
    @IBAction func checkModule3Question3(_ sender: UIButton) {
        checkingQuestionary(options: VBG_33_BTN1, VBG_33_BTN2, VBG_33_BTN3) ? nextPage(M1_CROSSWORD_BTN_N) : vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD3_Q3, inbold: nil, type: .failed)
    }
    @IBAction func checkModule3Question4(_ sender: UIButton) {
        checkingQuestionary(options: VBG_34_BTN1, VBG_34_BTN2, VBG_34_BTN3, VBG_34_BTN4) ? nextPage(M1_CROSSWORD_BTN_N) : vbgDelegate?.showMessagePopup(message: VGB_ERROR_RES.MOD3_Q4, inbold: nil, type: .failed)
    }
}
