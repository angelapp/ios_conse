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
    let MAX_LENGTH_CELL = 1
    let FILL_VERTICALLY = 0
    let FILL_HHORIZONTALY = 1
    
    weak var vbgDelegate: VBGProtocol?
    var currentSense: Int!
    
    
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
        
        currentSense = FILL_VERTICALLY
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        printDebugMessage(tag: "tf_tag: " + String(textField.tag))
        if textField.text!.count == MAX_LENGTH_CELL {
            printDebugMessage(tag: "asd: " + string)
            if let nextField = getNextTextField(forTextField: textField.tag) {
                nextField.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
    
    
    
    // MARK: Private Functions
    private func getNextTextField(forTextField tag: Int) -> UITextField! {
        
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
    
    private func updateButtonsState(sender: UIButton, buttons: [UIButton]) {
        if sender.isSelected {
            for button in buttons {
                if button != sender {
                    button.isSelected = false
                }
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func previousPage(_ sender: UIButton) {
        vbgDelegate?.previusPage()
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        vbgDelegate?.nextPage()
    }
    
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
                return
        }
        
        guard validateCrossword(word: M1CW_C_0307, M1CW_C_0308, M1CW_C_0309, M1CW_C_0310, M1CW_C_0311, M1CW_C_0312, option: 2)
            else {
                return
        }
        
        guard validateCrossword(word: M1CW_C_0402, M1CW_C_0502, M1CW_C_0602, M1CW_C_0702, M1CW_C_0802, M1CW_C_0902, option: 3)
            else {
                return
        }
        
        guard validateCrossword(word: M1CW_C_0502, M1CW_C_0503, M1CW_C_0504, M1CW_C_0505, M1CW_C_0506, M1CW_C_0507, M1CW_C_0508, M1CW_C_0509, M1CW_C_0510, option: 4)
            else {
                return
        }
        
        guard validateCrossword(word: M1CW_C_1006, M1CW_C_1007, M1CW_C_1008, M1CW_C_1009, M1CW_C_1010, M1CW_C_1011, M1CW_C_1012, option: 5)
            else {
                return
        }
        
        guard validateCrossword(word: M1CW_C_1206, M1CW_C_1207, M1CW_C_1208, M1CW_C_1209, M1CW_C_1210, M1CW_C_1211, option: 6)
            else {
                return
        }
    }

}
