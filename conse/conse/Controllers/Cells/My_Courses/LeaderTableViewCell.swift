//
//  LeaderTableViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 1/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class LeaderTableViewCell: UITableViewCell, UITextFieldDelegate, UIWebViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var btn_Aud1: UIButton!
    @IBOutlet weak var btn_Aud2: UIButton!
    @IBOutlet weak var btn_Aud3: UIButton!
    @IBOutlet weak var btn_Aud4: UIButton!
    
    @IBOutlet weak var btn_route_col: UIButton!
    @IBOutlet weak var btn_route_ind: UIButton!
    
    @IBOutlet weak var btn_opt1: UIButton!
    @IBOutlet weak var btn_opt2: UIButton!
    @IBOutlet weak var btn_opt3: UIButton!
    @IBOutlet weak var btn_opt4: UIButton!
    @IBOutlet weak var btn_opt5: UIButton!
    @IBOutlet weak var btn_opt6: UIButton!
    @IBOutlet weak var btn_opt7: UIButton!
    @IBOutlet weak var btn_opt8: UIButton!
    
    @IBOutlet weak var img_route: UIImageView!
    @IBOutlet weak var img_avatar: UIImageView!
    @IBOutlet weak var img_insignia: UIImageView!
    
    @IBOutlet weak var content_tilte: UIView!
    
    @IBOutlet weak var leaders_title: UILabel!
    @IBOutlet weak var leaders_subtitle: UILabel!
    @IBOutlet weak var leaders_review: UILabel!
    
    @IBOutlet weak var leaders_text1: UILabel!
    @IBOutlet weak var leaders_text2: UILabel!
    @IBOutlet weak var leaders_text3: UILabel!
    @IBOutlet weak var leaders_text4: UILabel!
    
    @IBOutlet weak var leaders_item1: UILabel!
    @IBOutlet weak var leaders_item2: UILabel!
    @IBOutlet weak var leaders_item3: UILabel!
    @IBOutlet weak var leaders_item4: UILabel!
    @IBOutlet weak var leaders_item5: UILabel!
    @IBOutlet weak var leaders_item6: UILabel!
    @IBOutlet weak var leaders_item7: UILabel!
    @IBOutlet weak var leaders_item8: UILabel!
    @IBOutlet weak var leaders_item9: UILabel!
    @IBOutlet weak var leaders_item10: UILabel!
    
    @IBOutlet weak var leaders_option1: UILabel!
    @IBOutlet weak var leaders_option2: UILabel!
    @IBOutlet weak var leaders_option3: UILabel!
    @IBOutlet weak var leaders_option4: UILabel!
    @IBOutlet weak var leaders_option5: UILabel!
    @IBOutlet weak var leaders_option6: UILabel!
    @IBOutlet weak var leaders_option7: UILabel!
    @IBOutlet weak var leaders_option8: UILabel!
    
    @IBOutlet weak var leaders_question: UILabel!
    
    @IBOutlet weak var leaders_text1_1: UILabel!
    @IBOutlet weak var leaders_text1_2: UILabel!
    @IBOutlet weak var leaders_text1_3: UILabel!
    @IBOutlet weak var leaders_text1_4: UILabel!
    @IBOutlet weak var leaders_text2_1: UILabel!
    @IBOutlet weak var leaders_text2_2: UILabel!
    @IBOutlet weak var leaders_text2_3: UILabel!
    @IBOutlet weak var leaders_text2_4: UILabel!
    @IBOutlet weak var leaders_text2_5: UILabel!
    @IBOutlet weak var leaders_text3_1: UILabel!
    @IBOutlet weak var leaders_text3_2: UILabel!
    @IBOutlet weak var leaders_text3_3: UILabel!
    @IBOutlet weak var leaders_text3_4: UILabel!
    
    @IBOutlet weak var leaders_textField1: UITextField!
    @IBOutlet weak var leaders_textField2: UITextField!
    @IBOutlet weak var leaders_textField3: UITextField!
    @IBOutlet weak var leaders_textField4: UITextField!
    @IBOutlet weak var leaders_textField5: UITextField!
    @IBOutlet weak var leaders_textField6: UITextField!
    @IBOutlet weak var leaders_textField7: UITextField!
    @IBOutlet weak var leaders_textField8: UITextField!
    @IBOutlet weak var leaders_textField9: UITextField!
    @IBOutlet weak var leaders_textField10: UITextField!
    
    @IBOutlet weak var leader_videoLoader: UIActivityIndicatorView!
    @IBOutlet weak var leader_videoPlayer: UIWebView!
    
    
    // MARK: - Properties
    let MIN_GLOBE_HEIGHT: CGFloat = 550
    let CORRECT_OPTION: Int = 1
    let WRONG_OPTION: Int = 0
    
    let LARGE_MARGIN: CGFloat = 24
    let MEDIUM_MARGIN: CGFloat = 16
    let SMALL_MARGIN: CGFloat = 8.0
    let PADDING_PORC: CGFloat = 0.02
    
    var answersButtons: Array<UIButton> = []
    var audioButtons: Array<UIButton> = []
    
    weak var leadersDelegate: LeadersProtocol?
    weak var mainDelegate: MainProtocol? = AplicationRuntime.sharedManager.mainDelegate
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Fill cell
    func fillLeader01() {
        leaders_title.text = LEADERS_COURSE.PAGE_01.title
        leaders_text1.text = LEADERS_COURSE.PAGE_01.t1
    }
    
    func fillLeader02() {
        content_tilte.underline(withTop: true)
        
        leaders_title.text = LEADERS_COURSE.PAGE_02.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_02.subtitle
        
        leaders_text1.text = LEADERS_COURSE.PAGE_02.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_02.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_02.t3
        
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_01.rawValue
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_02.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2]
    }
    
    func fillLeader03() {
        content_tilte.underline(withTop: true)
        
        leaders_title.text = LEADERS_COURSE.PAGE_03.title
        leaders_text1.text = LEADERS_COURSE.PAGE_03.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_03.t2
        
        leaders_item1.text = LEADERS_COURSE.PAGE_03.item1
        leaders_item2.text = LEADERS_COURSE.PAGE_03.item2
        leaders_item3.text = LEADERS_COURSE.PAGE_03.item3
        leaders_item4.text = LEADERS_COURSE.PAGE_03.item4
        leaders_item5.text = LEADERS_COURSE.PAGE_03.item5
        leaders_item6.text = LEADERS_COURSE.PAGE_03.item6
    }
    
    func fillLeader04() {
        content_tilte.underline(withTop: true)
        
        leaders_title.text = LEADERS_COURSE.PAGE_04.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_04.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_04.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_04.t3
        leaders_text4.text = LEADERS_COURSE.PAGE_04.t4
        
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false
        btn_Aud4.isSelected = false
        
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_03.rawValue
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_04.rawValue
        btn_Aud3.tag = LEADERS_AUDIO_ID.AUD_05.rawValue
        btn_Aud4.tag = LEADERS_AUDIO_ID.AUD_06.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3, btn_Aud4]
    }
    
    func fillLeader05() {
        content_tilte.underline(withTop: true)
        
        leaders_title.text = LEADERS_COURSE.PAGE_05.title
        
        leaders_text1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_05.t1, toWord: LEADERS_COURSE.PAGE_05.t1_inBold_1, LEADERS_COURSE.PAGE_05.t1_inBold_2, fontSize: leaders_text1.font.pointSize)
        leaders_text2.text = LEADERS_COURSE.PAGE_05.t2
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_07.rawValue
        
        audioButtons = [btn_Aud1]
    }
    
    func fillLeader06() {
        leaders_title.text = LEADERS_COURSE.PAGE_06.title
        
        leaders_text1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_06.t1, toWord: LEADERS_COURSE.PAGE_06.t1_inBold_1, LEADERS_COURSE.PAGE_06.t1_inBold_2, fontSize: leaders_text1.font.pointSize)
        leaders_text2.text = LEADERS_COURSE.PAGE_06.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_06.t3
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fillLeader07() {
        leaders_title.text = LEADERS_COURSE.PAGE_07.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_07.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_07.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_07.t3
        
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        btn_Aud3.isSelected = false
        
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_08.rawValue
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_09.rawValue
        btn_Aud3.tag = LEADERS_AUDIO_ID.AUD_10.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3]
    }
    
    func fillLeader08() {
        leaders_title.text = LEADERS_COURSE.PAGE_08.title
        leaders_text1.text = LEADERS_COURSE.PAGE_08.t1
    }
    
    func fillLeader09() {
        mainDelegate?.setImageBackground(withName: nullString)
        
        leaders_title.text = LEADERS_COURSE.PAGE_09.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_09.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_09.t2
        
        leaders_option1.text = LEADERS_COURSE.PAGE_09.options1
        leaders_option2.text = LEADERS_COURSE.PAGE_09.options2
        leaders_option3.text = LEADERS_COURSE.PAGE_09.options3
        
        leaders_text1_1.text = LEADERS_COURSE.PAGE_09.text1_1
        leaders_text1_2.text = LEADERS_COURSE.PAGE_09.text1_2
        leaders_text1_3.text = LEADERS_COURSE.PAGE_09.text1_3
        leaders_text1_4.text = LEADERS_COURSE.PAGE_09.text1_4
        leaders_text2_1.text = LEADERS_COURSE.PAGE_09.text2_1
        leaders_text2_2.text = LEADERS_COURSE.PAGE_09.text2_2
        leaders_text2_3.text = LEADERS_COURSE.PAGE_09.text2_3
        leaders_text2_4.text = LEADERS_COURSE.PAGE_09.text2_4
        leaders_text2_5.text = LEADERS_COURSE.PAGE_09.text2_5
        leaders_text3_1.text = LEADERS_COURSE.PAGE_09.text3_1
        leaders_text3_2.text = LEADERS_COURSE.PAGE_09.text3_2
        leaders_text3_3.text = LEADERS_COURSE.PAGE_09.text3_3
        leaders_text3_4.text = LEADERS_COURSE.PAGE_09.text3_4
        
        leaders_textField1.text = nullString; leaders_textField1.tag = 0; leaders_textField1.underlined(); leaders_textField1.delegate = self
        leaders_textField2.text = nullString; leaders_textField2.tag = 1; leaders_textField2.underlined(); leaders_textField2.delegate = self
        leaders_textField3.text = nullString; leaders_textField3.tag = 2; leaders_textField3.underlined(); leaders_textField3.delegate = self
        leaders_textField4.text = nullString; leaders_textField4.tag = 3; leaders_textField4.underlined(); leaders_textField4.delegate = self
        leaders_textField5.text = nullString; leaders_textField5.tag = 4; leaders_textField5.underlined(); leaders_textField5.delegate = self
        leaders_textField6.text = nullString; leaders_textField6.tag = 5; leaders_textField6.underlined(); leaders_textField6.delegate = self
        leaders_textField7.text = nullString; leaders_textField7.tag = 6; leaders_textField7.underlined(); leaders_textField7.delegate = self
        leaders_textField8.text = nullString; leaders_textField8.tag = 7; leaders_textField8.underlined(); leaders_textField8.delegate = self
        leaders_textField9.text = nullString; leaders_textField9.tag = 8; leaders_textField9.underlined(); leaders_textField9.delegate = self
        leaders_textField10.text = nullString; leaders_textField10.tag = 9; leaders_textField10.underlined(); leaders_textField10.delegate = self
    }
    
    func fillLeader10() {
        leaders_review.text = Strings.review_content
        leaders_title.text = LEADERS_COURSE.PAGE_10.title
        leaders_text1.text = LEADERS_COURSE.PAGE_10.t1
        leaders_text2.text = String(format: LEADERS_COURSE.PAGE_10.t2, getInsignia(forModule: .MOD_01))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: LeadersImages.insignia_01)
        mainDelegate?.setImageBackground(withName: LeadersImages.bg_01)
    }
    
    func fillLeader11() {
        mainDelegate?.setImageBackground(withName: nullString)
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        leaders_title.text = LEADERS_COURSE.PAGE_11.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_11.subtitle
        leaders_text1.text = LEADERS_COURSE.PAGE_11.t1
    }
    
    func fillLeader12() {
        leaders_title.text = LEADERS_COURSE.PAGE_12.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_12.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_12.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_12.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_12.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_12.item_04
        leaders_item5.text = LEADERS_COURSE.PAGE_12.item_05
        leaders_item6.text = LEADERS_COURSE.PAGE_12.item_06
        leaders_item7.text = LEADERS_COURSE.PAGE_12.item_07
        leaders_item8.text = LEADERS_COURSE.PAGE_12.item_08
        leaders_item9.text = LEADERS_COURSE.PAGE_12.item_09
        leaders_item10.text = LEADERS_COURSE.PAGE_12.item_10
    }
    
    func fillLeader13() {
        leaders_title.text = LEADERS_COURSE.PAGE_13.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_13.subtitle
        
        leaders_text1.text = LEADERS_COURSE.PAGE_13.t1
        leaders_text2.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_13.t2, toWord: LEADERS_COURSE.PAGE_13.t2_inBold, fontSize: leaders_text2.font.pointSize)
        
        leaders_item1.text = LEADERS_COURSE.PAGE_13.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_13.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_13.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_13.item_04
    }
    
    func fillLeader14() {
        leaders_title.text = LEADERS_COURSE.PAGE_14.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_14.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_14.t2
        
        btn_Aud1.isSelected = false
        btn_Aud2.isSelected = false
        
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_12.rawValue
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_13.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2]
    }
    
    func fillLeader15() {
        leaders_title.text = LEADERS_COURSE.PAGE_15.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_15.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_15.t2
        
        leaders_item1.text = LEADERS_COURSE.PAGE_15.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_15.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_15.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_15.item_04
        leaders_item5.text = LEADERS_COURSE.PAGE_15.item_05
    }
    
    func fillLeader16() {
        leaders_title.text = LEADERS_COURSE.PAGE_16.title
        leaders_text1.text = LEADERS_COURSE.PAGE_16.t1
        
        leaders_item1.text = LEADERS_COURSE.PAGE_16.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_16.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_16.item_03
    }
    
    func fillLeader17() {
        leaders_title.text = LEADERS_COURSE.PAGE_17.title
        leaders_text1.text = LEADERS_COURSE.PAGE_17.t1
    }
    
    func fillLeader18() {
        leaders_title.text = LEADERS_COURSE.PAGE_18.title
        leaders_text1.text = LEADERS_COURSE.PAGE_18.t1
        leaders_question.text = LEADERS_COURSE.PAGE_18.question
        
        leaders_option1.text = LEADERS_COURSE.PAGE_18.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_18.option_02
        leaders_option3.text = LEADERS_COURSE.PAGE_18.option_03
        leaders_option4.text = LEADERS_COURSE.PAGE_18.option_04
        leaders_option5.text = LEADERS_COURSE.PAGE_18.option_05
        leaders_option6.text = LEADERS_COURSE.PAGE_18.option_06
        leaders_option7.text = LEADERS_COURSE.PAGE_18.option_07
        leaders_option8.text = LEADERS_COURSE.PAGE_18.option_08
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        btn_opt5.isSelected = false
        btn_opt6.isSelected = false
        btn_opt7.isSelected = false
        btn_opt8.isSelected = false
        
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        btn_opt5.tag = WRONG_OPTION
        btn_opt6.tag = CORRECT_OPTION
        btn_opt7.tag = WRONG_OPTION
        btn_opt8.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4, btn_opt5, btn_opt6, btn_opt7, btn_opt8]
    }
    
    func fillLeader19() {
        leaders_title.text = LEADERS_COURSE.PAGE_19.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_19.subtitle
        
        leaders_text1.text = LEADERS_COURSE.PAGE_19.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_19.t2
        leaders_item1.text = LEADERS_COURSE.PAGE_19.item_01
    }
    
    func fillLeader20() {
        leaders_title.text = LEADERS_COURSE.PAGE_20.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_20.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_20.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_20.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_20.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_20.item_04
        leaders_item5.text = LEADERS_COURSE.PAGE_20.item_05
        leaders_item6.text = LEADERS_COURSE.PAGE_20.item_06
    }
    
    func fillLeader21() {
        leaders_title.text = LEADERS_COURSE.PAGE_21.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_21.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_21.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_21.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_21.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_21.item_04
        leaders_item5.text = LEADERS_COURSE.PAGE_21.item_05
        leaders_item6.text = LEADERS_COURSE.PAGE_21.item_06
    }
    
    func fillLeader22() {
        leaders_title.text = LEADERS_COURSE.PAGE_22.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_22.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_22.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_22.item_02
    }
    
    func fillLeader23() {
        leaders_title.text = LEADERS_COURSE.PAGE_23.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_23.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_23.item_01
    }
    
    func fillLeader24() {
        leaders_title.text = LEADERS_COURSE.PAGE_24.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_24.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_24.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_24.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_24.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_24.item_04
    }
    
    func fillLeader25() {
        leaders_title.text = LEADERS_COURSE.PAGE_25.title
        leaders_text1.text = LEADERS_COURSE.PAGE_25.t1
    }
    
    func fillLeader26() {
        mainDelegate?.setImageBackground(withName: nullString)
        leaders_title.text = LEADERS_COURSE.PAGE_26.title
        leaders_text1.text = LEADERS_COURSE.PAGE_26.t1
        leaders_question.text = LEADERS_COURSE.PAGE_26.question
        
        leaders_option1.text = LEADERS_COURSE.PAGE_26.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_26.option_02
        leaders_option3.text = LEADERS_COURSE.PAGE_26.option_03
        leaders_option4.text = LEADERS_COURSE.PAGE_26.option_04
        leaders_option5.text = LEADERS_COURSE.PAGE_26.option_05
        leaders_option6.text = LEADERS_COURSE.PAGE_26.option_06
        leaders_option7.text = LEADERS_COURSE.PAGE_26.option_07
        leaders_option8.text = LEADERS_COURSE.PAGE_26.option_08
        
        btn_opt1.isSelected = false
        btn_opt2.isSelected = false
        btn_opt3.isSelected = false
        btn_opt4.isSelected = false
        btn_opt5.isSelected = false
        btn_opt6.isSelected = false
        btn_opt7.isSelected = false
        btn_opt8.isSelected = false
        
        btn_opt1.tag = WRONG_OPTION
        btn_opt2.tag = WRONG_OPTION
        btn_opt3.tag = CORRECT_OPTION
        btn_opt4.tag = CORRECT_OPTION
        btn_opt5.tag = WRONG_OPTION
        btn_opt6.tag = CORRECT_OPTION
        btn_opt7.tag = WRONG_OPTION
        btn_opt8.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2, btn_opt3, btn_opt4, btn_opt5, btn_opt6, btn_opt7, btn_opt8]
    }
    
    func fillLeader27() {
        leaders_review.text = Strings.review_content
        leaders_title.text = LEADERS_COURSE.PAGE_27.title
        leaders_text1.text = LEADERS_COURSE.PAGE_27.t1
        leaders_text2.text = String(format: LEADERS_COURSE.PAGE_27.t2, getInsignia(forModule: .MOD_02))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: LeadersImages.insignia_02)
        mainDelegate?.setImageBackground(withName: LeadersImages.bg_02)
    }
    
    func fillLeader28() {
        mainDelegate?.setImageBackground(withName: nullString)
        leaders_title.text = LEADERS_COURSE.PAGE_28.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_28.subtitle
        
        leaders_text1.text = LEADERS_COURSE.PAGE_28.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_28.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_28.t3
    }
    
    func fillLeader29() {
        leaders_title.text = LEADERS_COURSE.PAGE_29.title
        
        leaders_text1.text = LEADERS_COURSE.PAGE_29.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_29.t2
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fillLeader30() {
        leaders_title.text = LEADERS_COURSE.PAGE_30.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_30.subtitle
        
        leaders_text1.text = LEADERS_COURSE.PAGE_30.t1
        leaders_item1.text = LEADERS_COURSE.PAGE_30.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_30.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_30.item_03
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
    }
    
    func fillLeader31() {
        leaders_title.text = LEADERS_COURSE.PAGE_31.title
        leaders_text1.text = LEADERS_COURSE.PAGE_31.t1
    }
    
    func fillLeader32() {
        btn_route_col.isEnabled = false
        leaders_title.text = LEADERS_COURSE.PAGE_32.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_32.subtitle
        leaders_text1.text = LEADERS_COURSE.PAGE_32.t1
        
//        img_route.image = UIImage(named: LeadersImages.route_32)
    }
    
    func fillLeader33() {
        leaders_title.text = LEADERS_COURSE.PAGE_33.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_33.subtitle
        leaders_text1.text =  LEADERS_COURSE.PAGE_33.t1
        
        leaders_item1.text = LEADERS_COURSE.PAGE_33.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_33.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_33.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_33.item_04
        leaders_item5.text = LEADERS_COURSE.PAGE_33.item_05
        leaders_item6.text = LEADERS_COURSE.PAGE_33.item_06
        leaders_item7.text = LEADERS_COURSE.PAGE_33.item_07
        leaders_item8.text = LEADERS_COURSE.PAGE_33.item_08
    }
    
    func fillLeader34() {
        leaders_title.text = LEADERS_COURSE.PAGE_34.title
        leaders_text1.text = LEADERS_COURSE.PAGE_34.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_34.t2
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_14.rawValue
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
        
        audioButtons = [btn_Aud1]
    }
    
    func fillLeader35() {
        leaders_title.text = LEADERS_COURSE.PAGE_35.title
        img_route.image = UIImage(named: LeadersImages.route_35)
    }
    
    func fillLeader36() {
        leaders_title.text = LEADERS_COURSE.PAGE_36.title
        
        leaders_item1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_36.item_01, toWord: LEADERS_COURSE.PAGE_36.item_01_inBold, fontSize: leaders_item1.font.pointSize)
        leaders_item2.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_36.item_02, toWord: LEADERS_COURSE.PAGE_36.item_02_inBold, fontSize: leaders_item2.font.pointSize)
        leaders_item3.text = LEADERS_COURSE.PAGE_36.item_03
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_15.rawValue
        
        audioButtons = [btn_Aud1]
    }
    
    func fillLeader37() {
        leaders_title.text = LEADERS_COURSE.PAGE_37.title
        img_route.image = UIImage(named: LeadersImages.route_37)
    }
    
    func fillLeader38() {
        leaders_title.text = LEADERS_COURSE.PAGE_38.title
        
        leaders_item1.text = LEADERS_COURSE.PAGE_38.item_01
        leaders_item2.text = LEADERS_COURSE.PAGE_38.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_38.item_03
        leaders_item4.text = LEADERS_COURSE.PAGE_38.item_04
        leaders_text1.text = LEADERS_COURSE.PAGE_38.t1
        leaders_text2.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_38.t2, toWord: LEADERS_COURSE.PAGE_38.t2_inBold_1, fontSize: leaders_text2.font.pointSize)
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_16.rawValue
        
        btn_Aud2.isSelected = false
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_17.rawValue
        
        btn_Aud3.isSelected = false
        btn_Aud3.tag = LEADERS_AUDIO_ID.AUD_18.rawValue
        
        btn_Aud4.isSelected = false
        btn_Aud4.tag = LEADERS_AUDIO_ID.AUD_19.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3, btn_Aud4]
    }
    
    func fillLeader39() {
        leaders_title.text = LEADERS_COURSE.PAGE_39.title
        
        leaders_item1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_39.item_01, toWord: LEADERS_COURSE.PAGE_39.item_01_inBold, fontSize: leaders_item1.font.pointSize)
        leaders_item2.text = LEADERS_COURSE.PAGE_39.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_39.item_03
        leaders_item4.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_39.item_04, toWord: LEADERS_COURSE.PAGE_39.item_04_inBold, fontSize: leaders_item4.font.pointSize)
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_20.rawValue
        
        btn_Aud2.isSelected = false
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_21.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2]
    }
    
    func fillLeader40() {
        leaders_title.text = LEADERS_COURSE.PAGE_40.title
        
        leaders_item1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_40.item_01, toWord: LEADERS_COURSE.PAGE_40.item_01_inBold, fontSize: leaders_item1.font.pointSize)
        leaders_item2.text = LEADERS_COURSE.PAGE_40.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_40.item_03
        leaders_item4.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_40.item_04, toWord: LEADERS_COURSE.PAGE_40.item_04_inBold, fontSize: leaders_item4.font.pointSize)
        leaders_item5.text = LEADERS_COURSE.PAGE_40.item_05
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_22.rawValue
        
        btn_Aud2.isSelected = false
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_23.rawValue
        
        btn_Aud3.isSelected = false
        btn_Aud3.tag = LEADERS_AUDIO_ID.AUD_24.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2, btn_Aud3]
    }
    
    func fillLeader41() {
        leaders_title.text = LEADERS_COURSE.PAGE_41.title
        leaders_text1.text = LEADERS_COURSE.PAGE_41.t1
    }
    
    func fillLeader42() {
        leaders_title.text = LEADERS_COURSE.PAGE_42.title
        leaders_text1.text = LEADERS_COURSE.PAGE_42.t1
        
        leaders_question.text = LEADERS_COURSE.PAGE_42.question
        leaders_option1.text = LEADERS_COURSE.PAGE_42.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_42.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = WRONG_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader43() {
        leaders_title.text = LEADERS_COURSE.PAGE_43.title
        
        leaders_question.text = LEADERS_COURSE.PAGE_43.question
        leaders_option1.text = LEADERS_COURSE.PAGE_43.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_43.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = WRONG_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader44() {
        mainDelegate?.setImageBackground(withName: nullString)
        
        leaders_title.text = LEADERS_COURSE.PAGE_44.title
        leaders_question.text = LEADERS_COURSE.PAGE_44.question
        leaders_option1.text = LEADERS_COURSE.PAGE_44.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_44.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = CORRECT_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader45() {
        leaders_review.text = Strings.review_content
        leaders_title.text = LEADERS_COURSE.PAGE_45.title
        leaders_text1.text = LEADERS_COURSE.PAGE_45.t1
        leaders_text2.text = String(format: LEADERS_COURSE.PAGE_45.t2, getInsignia(forModule: .MOD_03))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: LeadersImages.insignia_03)
        mainDelegate?.setImageBackground(withName: LeadersImages.bg_03)
    }
    
    func fillLeader46() {
        mainDelegate?.setImageBackground(withName: nullString)
        leaders_title.text = LEADERS_COURSE.PAGE_46.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_46.subtitle
        leaders_text1.text = LEADERS_COURSE.PAGE_46.t1
    }
    
    func fillLeader47() {
        leaders_title.text = LEADERS_COURSE.PAGE_47.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_47.subtitle
        
        leaders_item1.text = LEADERS_COURSE.PAGE_47.item_01
    }
    
    func fillLeader48() {
        leaders_title.text = LEADERS_COURSE.PAGE_48.title
        leaders_text1.text = LEADERS_COURSE.PAGE_48.t1
        
        img_avatar.image = AplicationRuntime.sharedManager.getAvatarImage()
    }
    
    func fillLeader49() {
        btn_route_ind.isEnabled = false
        leaders_title.text = LEADERS_COURSE.PAGE_49.title
    }
    
    func fillLeader50() {
        leaders_title.text = LEADERS_COURSE.PAGE_50.title
        img_route.image = UIImage(named: LeadersImages.route_50)
    }
    
    func fillLeader51() {
        leaders_title.text = LEADERS_COURSE.PAGE_51.title
        leaders_subtitle.text = LEADERS_COURSE.PAGE_51.subtitle
        
        leaders_text1.attributedText = addBoldWord(forText: LEADERS_COURSE.PAGE_51.t1, toWord: LEADERS_COURSE.PAGE_51.t1_inBold, fontSize: leaders_text1.font.pointSize)
        leaders_item2.text = LEADERS_COURSE.PAGE_51.item_02
        leaders_item3.text = LEADERS_COURSE.PAGE_51.item_03
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_26.rawValue
        
        btn_Aud2.isSelected = false
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_27.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2]
    }
    
    func fillLeader52() {
        leaders_title.text = LEADERS_COURSE.PAGE_52.title
        leaders_text1.text = LEADERS_COURSE.PAGE_52.t1
        leaders_text2.text = LEADERS_COURSE.PAGE_52.t2
        leaders_text3.text = LEADERS_COURSE.PAGE_52.t3
        leaders_text4.text = LEADERS_COURSE.PAGE_52.t4
        
        btn_Aud1.isSelected = false
        btn_Aud1.tag = LEADERS_AUDIO_ID.AUD_28.rawValue
        
        btn_Aud2.isSelected = false
        btn_Aud2.tag = LEADERS_AUDIO_ID.AUD_29.rawValue
        
        audioButtons = [btn_Aud1, btn_Aud2]
    }
    
    func fillLeader53() {
        leaders_title.text = LEADERS_COURSE.PAGE_53.title
        leaders_text1.text = LEADERS_COURSE.PAGE_53.t1
    }
    
    func fillLeader54() {
        leaders_title.text = LEADERS_COURSE.PAGE_54.title
        leader_videoPlayer.delegate =  self
    }
    
    func fillLeader55() {
        leaders_title.text = LEADERS_COURSE.PAGE_55.title
        leaders_text1.text = LEADERS_COURSE.PAGE_55.t1
        
        leaders_question.text = LEADERS_COURSE.PAGE_55.question
        leaders_option1.text = LEADERS_COURSE.PAGE_55.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_55.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = WRONG_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader56() {
        leaders_title.text = LEADERS_COURSE.PAGE_56.title
        
        leaders_question.text = LEADERS_COURSE.PAGE_56.question
        leaders_option1.text = LEADERS_COURSE.PAGE_56.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_56.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = CORRECT_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = WRONG_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader57() {
        mainDelegate?.setImageBackground(withName: nullString)
        leaders_title.text = LEADERS_COURSE.PAGE_57.title
        
        leaders_question.text = LEADERS_COURSE.PAGE_57.question
        leaders_option1.text = LEADERS_COURSE.PAGE_57.option_01
        leaders_option2.text = LEADERS_COURSE.PAGE_57.option_02
        
        btn_opt1.isSelected = false
        btn_opt1.tag = WRONG_OPTION
        
        btn_opt2.isSelected = false
        btn_opt2.tag = CORRECT_OPTION
        
        answersButtons = [btn_opt1, btn_opt2]
    }
    
    func fillLeader58() {
        leaders_review.text = Strings.review_content
        leaders_title.text = LEADERS_COURSE.PAGE_58.title
        leaders_text1.text = LEADERS_COURSE.PAGE_58.t1
        leaders_text2.text = String(format: LEADERS_COURSE.PAGE_58.t2, getInsignia(forModule: .MOD_04))
        
        img_avatar.image = AplicationRuntime.sharedManager.avatarImage
        img_insignia.image = UIImage(named: LeadersImages.insignia_04)
        mainDelegate?.setImageBackground(withName: LeadersImages.bg_04)
    }
    
    // MARK: - TextField Delegate
    //Action of the returnKey
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false
    }
    
    // MARK: - Acciones de navegación
    @IBAction func previousPage(_ sender: UIButton) {
        leadersDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton?) {
        leadersDelegate?.nextPage()
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
    
    // Update selected option in radioGroup
    @IBAction func updateRadioGroup(sender: UIButton) {
        for button in answersButtons {
            button.isSelected = (button == sender)
        }
    }
    
    // Change state to "PLAY"
    private func updateButtonsState(sender: UIButton) {
        if sender.isSelected {
            for button in audioButtons {
                if button != sender {
                    button.isSelected = false
                }
            }
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
    
    /// Verifica los campos. Valida en casacada (Valida el sigiente sii el primero esta bien)
    @IBAction func checking_page_09() {
        guard leaders_textField1.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer01.lowercased() else {
            leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
            leaders_textField1.text = nil
            return
        }

        guard (leaders_textField2.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer02.lowercased() ||
            leaders_textField2.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer03.lowercased()) else {
                leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
                leaders_textField2.text = nil
            return
        }

        guard (leaders_textField3.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer03.lowercased() ||
            leaders_textField3.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer02.lowercased()) &&
            (leaders_textField3.text?.lowercased() != leaders_textField2.text?.lowercased()) else {
                leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
                leaders_textField3.text = nil
            return
        }

        guard leaders_textField4.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer04.lowercased() else {
            leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
            leaders_textField4.text = nil
            return
        }

        guard (leaders_textField5.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer05.lowercased() ||
              leaders_textField5.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer05_2.lowercased()) else {
                leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
                leaders_textField5.text = nil
            return
        }

        guard leaders_textField6.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer06.lowercased() else {
            leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
            leaders_textField6.text = nil
            return
        }

        guard leaders_textField7.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer07.lowercased() else {
            leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
            leaders_textField7.text = nil
            return
        }

        guard leaders_textField8.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer08.lowercased() else {
            leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
            leaders_textField8.text = nil
            return
        }

        guard (leaders_textField9.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer09.lowercased() ||
            leaders_textField9.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer10.lowercased()) else {
                leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
                leaders_textField9.text = nil
            return
        }

        guard (leaders_textField10.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer10.lowercased() ||
                leaders_textField10.text?.lowercased() == LEADERS_COURSE.PAGE_09.answer09.lowercased()) && (
                leaders_textField9.text?.lowercased() != leaders_textField10.text?.lowercased()) else {
                    leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_09.error, inbold: nil, type: .failed)
                    leaders_textField10.text = nil
            return
        }
        
        nextPage(nil)
    }
    
    @IBAction func checking_page_18() {
        checkingQuestionary() ? leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.correct_answer, inbold: nil, type: .success) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_18.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_26() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_26.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_42() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_42.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_43() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_43.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_44() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_44.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_55() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_42.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_56() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_43.error, inbold: nil, type: .failed)
    }
    
    @IBAction func checking_page_57() {
        checkingQuestionary() ? nextPage(nil) : leadersDelegate?.showMessagePopup(message: LEADERS_COURSE.PAGE_44.error, inbold: nil, type: .failed)
    }
    
    // MARK: - Audio Functions
    @IBAction func playAudio(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        leadersDelegate?.audioManager(audioID: sender.tag, play: sender.isSelected)
        updateButtonsState(sender: sender)
    }
}
