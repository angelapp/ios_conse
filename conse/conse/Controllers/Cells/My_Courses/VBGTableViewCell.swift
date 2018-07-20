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
    @IBOutlet weak var btn_Aud1: UIButton!
    @IBOutlet weak var btn_Aud2: UIButton!
    @IBOutlet weak var btn_Aud3: UIButton!
    @IBOutlet weak var btn_Aud4: UIButton!

    @IBOutlet weak var btn_help1: UIButton!
    @IBOutlet weak var btn_help2: UIButton!
    @IBOutlet weak var btn_help3: UIButton!
    @IBOutlet weak var btn_help4: UIButton!
    @IBOutlet weak var btn_help5: UIButton!
    @IBOutlet weak var btn_help6: UIButton!
    
    @IBOutlet weak var btn_opt1: UIButton!
    @IBOutlet weak var btn_opt2: UIButton!
    @IBOutlet weak var btn_opt3: UIButton!
    @IBOutlet weak var btn_opt4: UIButton!
    @IBOutlet weak var btn_opt5: UIButton!
    
    @IBOutlet weak var btn_playMV: UIButton!
    @IBOutlet weak var btn_downloadMV: UIButton!
    
    @IBOutlet weak var content_tilte: UIView!
    
    @IBOutlet weak var img_route: UIImageView!
    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var img_insignia: UIImageView!

    @IBOutlet weak var lbl_Aud1: UILabel!
    @IBOutlet weak var lbl_Aud2: UILabel!
    @IBOutlet weak var lbl_Aud3: UILabel!
    @IBOutlet weak var lbl_Aud4: UILabel!
    
    @IBOutlet weak var lbl_item1: UILabel!
    @IBOutlet weak var lbl_item2: UILabel!
    @IBOutlet weak var lbl_item3: UILabel!
    @IBOutlet weak var lbl_item4: UILabel!
    @IBOutlet weak var lbl_item5: UILabel!
    @IBOutlet weak var lbl_item6: UILabel!
    @IBOutlet weak var lbl_item7: UILabel!
    @IBOutlet weak var lbl_item8: UILabel!
    @IBOutlet weak var lbl_item9: UILabel!
    @IBOutlet weak var lbl_item10: UILabel!
    @IBOutlet weak var lbl_item11: UILabel!
    
    @IBOutlet weak var lbl_option1: UILabel!
    @IBOutlet weak var lbl_option2: UILabel!
    @IBOutlet weak var lbl_option3: UILabel!
    @IBOutlet weak var lbl_option4: UILabel!
    @IBOutlet weak var lbl_option5: UILabel!
    
    @IBOutlet weak var lbl_question: UILabel!
    @IBOutlet weak var lbl_review: UILabel!
    @IBOutlet weak var lbl_subtitle: UILabel!
    @IBOutlet weak var lbl_text1: UILabel!
    @IBOutlet weak var lbl_text2: UILabel!
    @IBOutlet weak var lbl_text3: UILabel!
    @IBOutlet weak var lbl_text4: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var textField1: UITextField!
    
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
    
    // MARK: - Properties
    let CORRECT_OPTION: Int = 1
    let WRONG_OPTION: Int = 0
    let MAX_LENGTH_CELL = 1
    let OPTION_01_TAG = 0
    let OPTION_02_TAG = 1
    let OPTION_03_TAG = 2
    let OPTION_04_TAG = 3
    let OPTION_05_TAG = 4
    
    var crossword_word1: Array<UITextField> = []
    var crossword_word2: Array<UITextField> = []
    var crossword_word3: Array<UITextField> = []
    var crossword_word4: Array<UITextField> = []
    var crossword_word5: Array<UITextField> = []
    var crossword_word6: Array<UITextField> = []
    var answersButtons: Array<UIButton> = []
    var audioButtons: Array<UIButton> = []
    
    weak var vbgDelegate: VBGProtocol?
    weak var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate

    // MARK: - cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Llenado de las celdas
    // MARK: Module 1
    func fill_VBG_01() {
        lbl_text1.text = VBG_COURSE.PAGE_01.T1
        lbl_text2.text = VBG_COURSE.PAGE_01.T2
    }
    
    func fill_VBG_02() {
        lbl_text1.text = VBG_COURSE.PAGE_02.T1
        lbl_text2.attributedText = addBoldWord(forText: VBG_COURSE.PAGE_02.T2, toWord: VBG_COURSE.PAGE_02.T2_inBold_01, VBG_COURSE.PAGE_02.T2_inBold_02, fontSize: lbl_text2.font.pointSize)
        lbl_text3.text = VBG_COURSE.PAGE_02.T3
        lbl_text4.text = VBG_COURSE.PAGE_02.T4
    }
    
    func fill_VBG_03() {
        content_tilte?.topline()
        
        lbl_title.text = VBG_COURSE.PAGE_03.T1
        lbl_subtitle.text = VBG_COURSE.PAGE_03.T2
        lbl_text1.text = VBG_COURSE.PAGE_03.T3
        lbl_text2.text = VBG_COURSE.PAGE_03.T4
        lbl_text3.text = VBG_COURSE.PAGE_03.T5
        lbl_text4.text = VBG_COURSE.PAGE_03.T6
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_04() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_04.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_04.T1
        lbl_item1.text = VBG_COURSE.PAGE_04.ITEM_1
        lbl_item2.text = VBG_COURSE.PAGE_04.ITEM_2
        lbl_item3.text = VBG_COURSE.PAGE_04.ITEM_3
        lbl_item4.text = VBG_COURSE.PAGE_04.ITEM_4
        lbl_item5.text = VBG_COURSE.PAGE_04.ITEM_5
    }
    
    func fill_VBG_05() {
        content_tilte?.topline()
        
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false
        btn_Aud4.isSelected = false
        
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_01.rawValue
        btn_Aud2.tag = VBG_AUDIO_ID.AUD_02.rawValue
        btn_Aud3.tag = VBG_AUDIO_ID.AUD_03.rawValue
        btn_Aud4.tag = VBG_AUDIO_ID.AUD_04.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3, btn_Aud4]
        
        lbl_title.text = VBG_COURSE.PAGE_05.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_05.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_05.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_05.AUDIO_1
        lbl_Aud2.text = VBG_COURSE.PAGE_05.AUDIO_2
        lbl_Aud3.text = VBG_COURSE.PAGE_05.AUDIO_3
        lbl_Aud4.text = VBG_COURSE.PAGE_05.AUDIO_4
    }

    func fill_VBG_06() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_06.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_06.T1
        lbl_text2.text = VBG_COURSE.PAGE_06.T2
        lbl_item1.text = VBG_COURSE.PAGE_06.ITEM_1
        lbl_item2.text = VBG_COURSE.PAGE_06.ITEM_2
        lbl_item3.text = VBG_COURSE.PAGE_06.ITEM_3
        lbl_item4.text = VBG_COURSE.PAGE_06.ITEM_4
        lbl_item5.text = VBG_COURSE.PAGE_06.ITEM_5
        lbl_item6.text = VBG_COURSE.PAGE_06.ITEM_6
        lbl_item7.text = VBG_COURSE.PAGE_06.ITEM_7
        lbl_item8.text = VBG_COURSE.PAGE_06.ITEM_8
        lbl_item9.text = VBG_COURSE.PAGE_06.ITEM_9
        lbl_item10.text = VBG_COURSE.PAGE_06.ITEM_10
        lbl_item11.text = VBG_COURSE.PAGE_06.ITEM_11
    }
    
    func fill_VBG_07() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_07.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_07.T1
        lbl_item1.text = VBG_COURSE.PAGE_07.ITEM_1
    }
    
    func fill_VBG_08() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false
        btn_Aud4.isSelected = false
        
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_05.rawValue
        btn_Aud2.tag = VBG_AUDIO_ID.AUD_06.rawValue
        btn_Aud3.tag = VBG_AUDIO_ID.AUD_07.rawValue
        btn_Aud4.tag = VBG_AUDIO_ID.AUD_08.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3, btn_Aud4]
     
        lbl_title.text = VBG_COURSE.PAGE_08.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_08.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_08.AUDIO_1
        lbl_Aud2.text = VBG_COURSE.PAGE_08.AUDIO_2
        lbl_Aud3.text = VBG_COURSE.PAGE_08.AUDIO_3
        lbl_Aud4.text = VBG_COURSE.PAGE_08.AUDIO_4
    }
    
    func fill_VBG_09() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_09.rawValue
        
        audioButtons = [btn_Aud1]
     
        lbl_title.text = VBG_COURSE.PAGE_09.TITLE
        lbl_Aud1.text = VBG_COURSE.PAGE_09.AUDIO_1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_10() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_10.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_10.T1
        
        saveActivity(activity: ActivitiesAbreviature.MOD_1_R.rawValue, forModule: TopicsIDs.mod_01.rawValue)
    }

    // CrossWord
    func fill_VBG_11() {
        mainDelegate?.setImageBackground(withName: nullString)
        lbl_text1.text = VBG_COURSE.PAGE_11.T1
        
        // Clear crossword
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
        
        // Arreglos de letras para las palabras
        crossword_word1 = [M1CW_C_0209, M1CW_C_0309, M1CW_C_0409, M1CW_C_0509, M1CW_C_0609, M1CW_C_0709, M1CW_C_0809, M1CW_C_0909, M1CW_C_1009, M1CW_C_1109, M1CW_C_1209]
        crossword_word2 = [M1CW_C_0307, M1CW_C_0308, M1CW_C_0309, M1CW_C_0310, M1CW_C_0311, M1CW_C_0312]
        crossword_word3 = [M1CW_C_0402, M1CW_C_0502, M1CW_C_0602, M1CW_C_0702, M1CW_C_0802, M1CW_C_0902]
        crossword_word4 = [M1CW_C_0502, M1CW_C_0503, M1CW_C_0504, M1CW_C_0505, M1CW_C_0506, M1CW_C_0507, M1CW_C_0508, M1CW_C_0509, M1CW_C_0510]
        crossword_word5 = [M1CW_C_1006, M1CW_C_1007, M1CW_C_1008, M1CW_C_1009, M1CW_C_1010, M1CW_C_1011, M1CW_C_1012]
        crossword_word6 = [M1CW_C_1206, M1CW_C_1207, M1CW_C_1208, M1CW_C_1209, M1CW_C_1210, M1CW_C_1211]
    }
    
    func fill_VBG_12(){
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = VBG_COURSE.PAGE_12.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_12.T1
        lbl_text2.text = String(format: VBG_COURSE.PAGE_12.T2, getInsignia(forModule: .MOD_01))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_01)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_01)
    }
    
    // MARK: MODULE 2
    func fill_VBG_13() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_10.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_13.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_13.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_13.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_13.AUDIO_1
    }
    
    func fill_VBG_14() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_14.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_14.T1
        
        saveActivity(activity: ActivitiesAbreviature.MOD_2_R.rawValue, forModule: TopicsIDs.mod_02.rawValue)
    }
    
    func fill_VBG_15() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_15.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_15.T1
        lbl_text2.text = VBG_COURSE.PAGE_15.T2
        
        lbl_option1.text = VBG_COURSE.PAGE_15.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_15.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_15.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_15.OPT4
        lbl_option5.text = VBG_COURSE.PAGE_15.OPT5
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        btn_opt5.isSelected = false
        
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        btn_opt5.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4, btn_opt5]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        lbl_option5.tag = OPTION_05_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
        
        let tapOption05 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option5.isUserInteractionEnabled = true
        lbl_option5.addGestureRecognizer(tapOption05)
    }
    
    func fill_VBG_16() {
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = VBG_COURSE.PAGE_16.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_16.T1
        lbl_text2.text = String(format: VBG_COURSE.PAGE_16.T2, getInsignia(forModule: .MOD_02))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_02)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_02)
    }
    
    // MARK: MODULE 3
    func fill_VBG_17() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_17.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_17.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_17.T1
        lbl_text2.text = VBG_COURSE.PAGE_17.T2
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_18() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_11.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_18.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_18.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_18.T1
        lbl_item1.text = VBG_COURSE.PAGE_18.ITEM_1
        lbl_item2.text = VBG_COURSE.PAGE_18.ITEM_2
        lbl_item3.text = VBG_COURSE.PAGE_18.ITEM_3
        lbl_Aud1.text = VBG_COURSE.PAGE_18.AUDIO_1
    }
    
    func fill_VBG_19() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_19.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_19)
    }
    
    func fill_VBG_20() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_12.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_20.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_20.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_20.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_20.AUDIO_1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fill_VBG_21() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_21.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_21)
    }
    
    func fill_VBG_22() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_13.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_22.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_22.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_22.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_22.AUDIO_1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_VBG_23() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_23.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_23)
    }

    func fill_VBG_24() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_14.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_24.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_24.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_24.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_24.AUDIO_1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_VBG_25() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_25.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_25)
    }

    func fill_VBG_26() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_26.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_26)
    }

    func fill_VBG_27() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_27.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_27)
    }

    func fill_VBG_28() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_14.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_28.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_28.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_28.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_28.AUDIO_1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_VBG_29() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_29.TITLE
        img_route.image = UIImage(named: RoutesImages.route_VBG_29)
    }

    func fill_VBG_30() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_30.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_30.T1
        
        saveActivity(activity: ActivitiesAbreviature.MOD_3_R.rawValue, forModule: TopicsIDs.mod_03.rawValue)
    }

    func fill_VBG_31() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_31.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_31.T1
        
        lbl_question.text = VBG_COURSE.PAGE_31.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_31.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_31.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_31.OPT3
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG

        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3]
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_VBG_32() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_32.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_32.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_32.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_32.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_32.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_32.OPT4
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_33() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_33.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_33.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_33.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_33.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_33.OPT3
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false

        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3]
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_VBG_34() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_34.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_34.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_34.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_34.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_34.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_34.OPT4
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false

        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_35() {
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = VBG_COURSE.PAGE_35.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_35.T1
        lbl_text2.text = String(format: VBG_COURSE.PAGE_35.T2, getInsignia(forModule: .MOD_03))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_03)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_03)
    }

    // MARK: Modulo 4
    func fill_VBG_36() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_36.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_36.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_36.T1
    }

    func fill_VBG_37() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_37.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_37.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_37.T1
        
        img_route.image = UIImage(named: RoutesImages.route_VBG_37)
    }

    func fill_VBG_38() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_16.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_38.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_38.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_38.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_38.AUDIO_1
        
        img_route.image = UIImage(named: RoutesImages.route_VBG_38)
    }

    func fill_VBG_39() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false
        
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_17.rawValue
        btn_Aud2.tag = VBG_AUDIO_ID.AUD_18.rawValue
        btn_Aud3.tag = VBG_AUDIO_ID.AUD_19.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3]
        
        lbl_title.text = VBG_COURSE.PAGE_39.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_39.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_39.T1
        
        lbl_Aud1.text = VBG_COURSE.PAGE_39.AUDIO_1
        lbl_Aud2.text = VBG_COURSE.PAGE_39.AUDIO_2
        lbl_Aud3.text = VBG_COURSE.PAGE_39.AUDIO_3
    }

    func fill_VBG_40() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_20.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_40.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_40.T1
        lbl_Aud1.text = VBG_COURSE.PAGE_40.AUDIO_1
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_VBG_41() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_41.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_41.T1
        lbl_text2.text = VBG_COURSE.PAGE_41.T2
        lbl_text3.text = VBG_COURSE.PAGE_41.T3
        lbl_item1.text = VBG_COURSE.PAGE_41.ITEM_1
        lbl_item2.text = VBG_COURSE.PAGE_41.ITEM_2
        lbl_item3.text = VBG_COURSE.PAGE_41.ITEM_3
        lbl_item4.text = VBG_COURSE.PAGE_41.ITEM_4
        lbl_item5.text = VBG_COURSE.PAGE_41.ITEM_5
        lbl_item6.text = VBG_COURSE.PAGE_41.ITEM_6
    }

    func fill_VBG_42() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_42.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_42.T1
        lbl_text2.text = VBG_COURSE.PAGE_42.T2
        lbl_item1.text = VBG_COURSE.PAGE_42.ITEM_1
        lbl_item2.text = VBG_COURSE.PAGE_42.ITEM_2
    }

    func fill_VBG_43() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_43.TITLE
        lbl_text1.attributedText = addBoldWord(forText: VBG_COURSE.PAGE_43.T1, toWord: VBG_COURSE.PAGE_43.T1_inBOLD, fontSize: lbl_text1.font.pointSize)
        lbl_text2.attributedText = addBoldWord(forText: VBG_COURSE.PAGE_43.T2, toWord: VBG_COURSE.PAGE_43.T2_inBOLD, fontSize: lbl_text2.font.pointSize)
        lbl_item1.attributedText = addBoldWord(forText: VBG_COURSE.PAGE_43.ITEM_1, toWord: VBG_COURSE.PAGE_43.ITEM_1_inBOLD, fontSize: lbl_item1.font.pointSize)
        lbl_item2.attributedText = addBoldWord(forText: VBG_COURSE.PAGE_43.ITEM_2, toWord: VBG_COURSE.PAGE_43.ITEM_2_inBOLD, fontSize: lbl_item2.font.pointSize)
    }

    func fill_VBG_44() {
        content_tilte?.topline()
        btn_Aud1.isSelected = false
        btn_Aud1.tag = VBG_AUDIO_ID.AUD_21.rawValue
        
        audioButtons = [btn_Aud1]
        
        lbl_title.text = VBG_COURSE.PAGE_44.TITLE
        lbl_subtitle.text = VBG_COURSE.PAGE_44.SUBTITLE
        lbl_text1.text = VBG_COURSE.PAGE_44.T1
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }

    func fill_VBG_45() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_45.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_45.T1
        
        saveActivity(activity: ActivitiesAbreviature.MOD_4_R.rawValue, forModule: TopicsIDs.mod_04.rawValue)
    }

    func fill_VBG_46() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_46.TITLE
    }

    func fill_VBG_47() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_47.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_47.T1
        
        lbl_question.text = VBG_COURSE.PAGE_47.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_47.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_47.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_47.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_47.OPT4
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = WRONG_OPTION
        btn_opt4.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_48() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_48.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_48.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_48.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_48.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_48.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_48.OPT4
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        
        // set tag for identify correct option
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = WRONG_OPTION
        btn_opt4.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_49() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_49.TITLE
        lbl_question.text = VBG_COURSE.PAGE_49.QUESTION
        textField1.text = nullString
    }

    func fill_VBG_50() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_50.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_50.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_50.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_50.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_50.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_50.OPT4
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        
        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_51() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_51.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_51.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_51.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_51.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_51.OPT3
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        
        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_VBG_52() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_52.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_52.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_52.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_52.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_52.OPT3
        
        // set tag for identify correct option
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
    }

    func fill_VBG_53() {
        content_tilte?.topline()
        lbl_title.text = VBG_COURSE.PAGE_53.TITLE
        
        lbl_question.text = VBG_COURSE.PAGE_53.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_53.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_53.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_53.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_53.OPT4
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        
        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_54() {
        mainDelegate?.setImageBackground(withName: nullString)
        content_tilte?.topline()
        
        lbl_title.text = VBG_COURSE.PAGE_54.TITLE
        lbl_question.text = VBG_COURSE.PAGE_54.QUESTION
        lbl_option1.text = VBG_COURSE.PAGE_54.OPT1
        lbl_option2.text = VBG_COURSE.PAGE_54.OPT2
        lbl_option3.text = VBG_COURSE.PAGE_54.OPT3
        lbl_option4.text = VBG_COURSE.PAGE_54.OPT4
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        
        // set tag for identify correct option
        btn_opt1.tag = CORRECT_OPTION
        btn_opt2.tag = CORRECT_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4]
        
        lbl_option1.tag = OPTION_01_TAG
        lbl_option2.tag = OPTION_02_TAG
        lbl_option3.tag = OPTION_03_TAG
        lbl_option4.tag = OPTION_04_TAG
        
        let tapOption01 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option1.isUserInteractionEnabled = true
        lbl_option1.addGestureRecognizer(tapOption01)
        
        let tapOption02 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option2.isUserInteractionEnabled = true
        lbl_option2.addGestureRecognizer(tapOption02)
        
        let tapOption03 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option3.isUserInteractionEnabled = true
        lbl_option3.addGestureRecognizer(tapOption03)
        
        let tapOption04 = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel))
        lbl_option4.isUserInteractionEnabled = true
        lbl_option4.addGestureRecognizer(tapOption04)
    }

    func fill_VBG_55() {
        content_tilte?.topline()
        lbl_review.text = Strings.review_content
        lbl_title.text = VBG_COURSE.PAGE_55.TITLE
        lbl_text1.text = VBG_COURSE.PAGE_55.T1
        lbl_text2.text = String(format: VBG_COURSE.PAGE_55.T2, getInsignia(forModule: .MOD_04))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: BackgroundInsignia.insignia_04)
        mainDelegate?.setImageBackground(withName: BackgroundInsignia.bg_04)
    }
    
    // MARK: - Save Activities completed
    private func saveActivity(activity name: String, forModule id: Int) {
        
        //Obtiene la fecha actual
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = DateTimeFormat.formatInMillis
        
        // save Activity complete
        let actCompleted:ActityCompleted = ActityCompleted()
        actCompleted.courseID = CourseIDs.VBG.rawValue
        actCompleted.topicID = id
        actCompleted.activity = name
        actCompleted.dateCompleted = formatter.string(from: date)
        
        // se envia post a servidor Si la respuesta es VERDADERA
        guard let requestModel = saveProgress(forActivity: actCompleted) else {
            return
        }
        
        vbgDelegate?.sendRequest(formModel: requestModel)
    }
    
    // MARK: - Acciones de navegación
    @IBAction func previousPage(_ sender: UIButton) {
        vbgDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton?) {
        vbgDelegate?.nextPage()
    }
    
    @IBAction func endCourse(_ sender: UIButton) {
        mainDelegate?.setImageBackground(withName: nullString)
        mainDelegate?.addToContainer(viewControllerID: .myCourses)
    }
    // MARK: - update buttons states
    // change state for checkBox
    @IBAction func changeButtonState(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    @objc func tapLabel(sender: UITapGestureRecognizer) {
        
        let labelTapped = sender.view!
        let labelTag = labelTapped.tag
        
        changeButtonState(answersButtons[labelTag])
    }
    
    // Update selected option in radioGroup
    @IBAction func updateRadioGroup(sender: UIButton) {
        for button in answersButtons {
            button.isSelected = (button == sender)
        }
    }
    
    // Cambia el estado del boton que este reproduciendo el audio y actualiza los demás
    private func updateButtonsState(sender: UIButton) {
        if sender.isSelected {
            for button in audioButtons {
                if button != sender {
                    button.isSelected = false
                }
            }
        }
    }
    
    // MARK: - Audio Functions
    @IBAction func playAudio(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        vbgDelegate?.audioManager(audioID: sender.tag, play: sender.isSelected)
        updateButtonsState(sender: sender)
    }
    
    // MARK: - TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Cambia el foco a la siguente celda, cuando hay un caracter
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
    
//    // Limpia la cailla cuando se empieza a editar
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text = nil
//    }
    
    /**
     Determina cual es la celda siguiente a la que se debe cambiar el foco
     de acuerdo a la celda actual, si no existe celda siguinete, retorna NIL
     
     - Parameter forTexfield: Id del textField actual
     */
    private func getNextTextField(forTextField tag: Int) -> UITextField! {
        
        // Cambia los ID de las celdas que comparten "LETRAS" de acuerdo a su predecesos
        M1CW_C_0309.tag = M1CW_C_0308.tag == tag ? 23 : 2
        M1CW_C_0502.tag = M1CW_C_0402.tag == tag ? 32 : 41
        M1CW_C_0509.tag = M1CW_C_0508.tag == tag ? 48 : 4
        M1CW_C_1009.tag = M1CW_C_1008.tag == tag ? 54 : 9
        M1CW_C_1209.tag = M1CW_C_1208.tag == tag ? 64 : 11
        
        // Listado de los TextField del crugigrama
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
        
        // Busca en las lista de textFields la celda siguiente y la retorna
        for cell in cw_cells {
            if cell?.tag == (tag + 1) {
                return cell
            }
        }
        
        // retorna nulo si no se encuentra la celda siguinete
        return nil
    }
    
    // MARK: - Ayudas
    @IBAction func showHelp(_ sender: UIButton) {
        
        switch sender {
            
        case btn_help1:
            vbgDelegate?.showPopupHelp(title: (btn_help1.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_1)
            break
            
        case btn_help2:
            vbgDelegate?.showPopupHelp(title: (btn_help2.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_2)
            break
            
        case btn_help3:
            vbgDelegate?.showPopupHelp(title: (btn_help3.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_3)
            break
            
        case btn_help4:
            vbgDelegate?.showPopupHelp(title: (btn_help4.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_4)
            break
            
        case btn_help5:
            vbgDelegate?.showPopupHelp(title: (btn_help5.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_5)
            break
            
        default:
            vbgDelegate?.showPopupHelp(title: (btn_help6.titleLabel?.text)!, text: VBG_COURSE.PAGE_11.HELP_6)
            break
        }
    }
    
    // MARK: - Video Manager
    @IBAction func videoActionManage (_ sender: UIButton) {
        
        switch sender {
            
        case btn_downloadMV:
            vbgDelegate?.downloadMV(title: VideosTitles.vbg_video, urlStr: VideosURL.vbg_url)
            break
            
        default:
            vbgDelegate?.playMV(urlStr: VideosURL.vbg_url)
            break
        }
        
    }
    
    // MARK: - Validaciones
    /// Verifica que el boton de opcion este seleccionado, si esta marcado como respuesta correcta, o deseleccionado en caso contrario
    private func checkingQuestionary() -> Bool {
        
        for option in answersButtons {
            if option.tag == CORRECT_OPTION {
                guard option.isSelected else { return false }
            }
            else {
                guard !option.isSelected else { return false }
            }
        }
        return true
    }
    
    // Verifica por palabra, si corresponde a la respuesta esperada
    @IBAction func checking_page_11 (_ sender: UIButton) {
        
        guard
            validateCrossword(word: crossword_word1, correctAnswer: VBG_COURSE.PAGE_11.clue_1),
            validateCrossword(word: crossword_word2, correctAnswer: VBG_COURSE.PAGE_11.clue_2),
            validateCrossword(word: crossword_word3, correctAnswer: VBG_COURSE.PAGE_11.clue_3),
            validateCrossword(word: crossword_word4, correctAnswer: VBG_COURSE.PAGE_11.clue_4),
            validateCrossword(word: crossword_word5, correctAnswer: VBG_COURSE.PAGE_11.clue_5),
            validateCrossword(word: crossword_word6, correctAnswer: VBG_COURSE.PAGE_11.clue_6)
            else {
                vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_11.ERROR, inbold: nil, type: .failed)
                return
        }
        
        saveActivity(activity: ActivitiesAbreviature.MOD_1_CW1.rawValue, forModule: TopicsIDs.mod_01.rawValue)
        nextPage(nil)
    }
    
    @IBAction func checking_page_15(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_1_Q1.rawValue, forModule: TopicsIDs.mod_02.rawValue)
            nextPage(nil)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_15.ERROR, inbold: VBG_COURSE.PAGE_15.ERROR_INBOLD, type: .failed)
        }
    }
    
    @IBAction func checking_page_31(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q1.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_31.ERROR, inbold: nil, type: .failed)
        }
    }
    
    @IBAction func checking_page_32(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q2.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_32.ERROR, inbold: nil, type: .failed)
        }
    }
    
    @IBAction func checking_page_33(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q3.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_33.ERROR, inbold: nil, type: .failed)
        }
    }
    
    @IBAction func checking_page_34(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_3_Q4.rawValue, forModule: TopicsIDs.mod_03.rawValue)
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.correct_answer, inbold: nil, type: .success)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_34.ERROR, inbold: nil, type: .failed)
        }
    }
    @IBAction func checking_page_47(_ sender: UIButton) {
        if checkingQuestionary() {
            saveActivity(activity: ActivitiesAbreviature.MOD_4_Q1.rawValue, forModule: TopicsIDs.mod_04.rawValue)
            nextPage(nil)
        }
        else {
            vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_47.ERROR, inbold: nil, type: .failed)
        }
    }
    
    @IBAction func checking_page_48(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_48.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_49(_ sender: UIButton) {
        textField1.text?.trimmingCharacters(in: .whitespaces) == EmergencyStrings.line_155 ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_49.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_50(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_50.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_51(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_51.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_52(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_52.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_53(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_53.ERROR, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_54(_ sender: UIButton) {
        checkingQuestionary() ? nextPage(nil) : vbgDelegate?.showMessagePopup(message: VBG_COURSE.PAGE_54.ERROR, inbold: nil, type: .failed)
    }
}
