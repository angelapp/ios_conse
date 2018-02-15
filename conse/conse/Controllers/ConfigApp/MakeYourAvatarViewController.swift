//
//  MakeYourAvatarViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 11/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class MakeYourAvatarViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var btn_next: UIButton!
    
    @IBOutlet weak var btn_skin_1: UIButton!
    @IBOutlet weak var btn_skin_2: UIButton!
    @IBOutlet weak var btn_skin_3: UIButton!
    @IBOutlet weak var btn_hair_1: UIButton!
    @IBOutlet weak var btn_hair_2: UIButton!
    @IBOutlet weak var btn_hair_3: UIButton!
    @IBOutlet weak var btn_eyes_1: UIButton!
    @IBOutlet weak var btn_eyes_2: UIButton!
    @IBOutlet weak var btn_eyes_3: UIButton!
    @IBOutlet weak var btn_mouth_1: UIButton!
    @IBOutlet weak var btn_mouth_2: UIButton!
    @IBOutlet weak var btn_mouth_3: UIButton!
    @IBOutlet weak var btn_accessories_1: UIButton!
    @IBOutlet weak var btn_accessories_2: UIButton!
    @IBOutlet weak var btn_accessories_3: UIButton!
    
    @IBOutlet weak var cnt_avatar: UIView!
    @IBOutlet weak var cnt_avatarPieces: UIView!
    @IBOutlet weak var cnt_buttons: UIView!
    
    @IBOutlet weak var img_avatarSkin: UIImageView!
    @IBOutlet weak var img_avatarHair: UIImageView!
    @IBOutlet weak var img_avatarEyes: UIImageView!
    @IBOutlet weak var img_avatarMouth: UIImageView!
    @IBOutlet weak var img_avatarAcc: UIImageView!
    
    @IBOutlet weak var img_skin_1: UIImageView!
    @IBOutlet weak var img_skin_2: UIImageView!
    @IBOutlet weak var img_skin_3: UIImageView!
    @IBOutlet weak var img_hair_1: UIImageView!
    @IBOutlet weak var img_hair_2: UIImageView!
    @IBOutlet weak var img_hair_3: UIImageView!
    @IBOutlet weak var img_eyes_1: UIImageView!
    @IBOutlet weak var img_eyes_2: UIImageView!
    @IBOutlet weak var img_eyes_3: UIImageView!
    @IBOutlet weak var img_mouth_1: UIImageView!
    @IBOutlet weak var img_mouth_2: UIImageView!
    @IBOutlet weak var img_mouth_3: UIImageView!
    @IBOutlet weak var img_accessories_1: UIImageView!
    @IBOutlet weak var img_accessories_2: UIImageView!
    @IBOutlet weak var img_accessories_3: UIImageView!
    
    // MARK: - Properties
    var skinPiecesList: Array<AvatarPiece>!
    var hairPiecesList: Array<AvatarPiece>!
    var eyesPiecesList: Array<AvatarPiece>!
    var mouthPiecesList: Array<AvatarPiece>!
    var accessoriesPiecesList: Array<AvatarPiece>!
    
    var radioGroupSkin: Array<UIButton>!
    var radioGroupHair: Array<UIButton>!
    var radioGroupEyes: Array<UIButton>!
    var radioGroupMouth: Array<UIButton>!
    var radioGroupAcc: Array<UIButton>!
    
    var piecesGrid: [Array<AvatarPiece>] = []
    
    var myAvatar = AplicationRuntime.sharedManager.getAvatarPieces()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        getPiecesList()
        addStyles()
        fillRadioGroups()
        fillGrid()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    private func addStyles() {
        
        setBackTitle(forViewController: self, title: blankSpace)
        
        // Set Aspect fit to all grid Buttons and add the same tag to radioButton as image
        // row (fila), pos (posicion en la fila)
        var row = 0, posBtn = 0, posImg = 0
        for view in cnt_avatarPieces.subviews {
            posBtn = 0; posImg = 0
            
            for subView in view.subviews {
                
                if let button = subView as? UIButton {
                    button.imageView?.contentMode = .scaleAspectFit
                    button.tag = (row * 10) + posBtn
                    posBtn += 1
                }
                
                if let img = subView as? UIImageView {
                    img.tag = (row * 10) + posImg
                    posImg += 1
                }
            }
            row += 1
        }
        
        btn_next.imageView?.contentMode = .scaleAspectFit
    }
    
    /// Carga las listas de cada parte del avatar, obteniendo las piezas del runtime
    private func getPiecesList() {
        skinPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Skin)
        hairPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Hair)
        eyesPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Eyes)
        mouthPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Mouth)
        accessoriesPiecesList = AplicationRuntime.sharedManager.getPiecesList(forPart: .Accessories)
        
        piecesGrid = [skinPiecesList, hairPiecesList, eyesPiecesList, mouthPiecesList, accessoriesPiecesList]
    }
    
    /// Se llenan los arreglos con los botones para crear los radioGroups
    private func fillRadioGroups() {
        radioGroupSkin = [btn_skin_1, btn_skin_2, btn_skin_3]
        radioGroupEyes = [btn_eyes_1, btn_eyes_2, btn_eyes_3]
        radioGroupHair = [btn_hair_1, btn_hair_2, btn_hair_3]
        radioGroupMouth = [btn_mouth_1, btn_mouth_2, btn_mouth_3]
        radioGroupAcc = [btn_accessories_1, btn_accessories_2, btn_accessories_3]
    }
    
    /// llena la grilla de partes
    private func fillGrid() {
        
        guard piecesGrid.count > 0 else { return }
        
        var col = 0, row = 0
        for view in cnt_avatarPieces.subviews {
            col = 0
            for subView in view.subviews {
                if let img = subView as? UIImageView {
                    downloadImage(imgView: img, urlImage: piecesGrid[row][col].icon)
                    col += 1
                }
            }
            row += 1
        }
    }
    
    private func updateStateButtons(radioGroup: [UIButton], buttonId tag: Int) {
        for button in radioGroup {
            button.isSelected = button.tag == tag ? true : false
        }
    }
    
    // MARK: - Actions buttons
    
    @IBAction func updateSelected(_ sender: UIButton) {
        let listPart: Int = Int( sender.tag / 10)
        let posInList: Int =  sender.tag % 10
        
        switch listPart {
            
        case SKIN_GRID:
            downloadImage(imgView: img_avatarSkin, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupSkin, buttonId: sender.tag)
            myAvatar?.skinID = piecesGrid[listPart][posInList].id
            break
            
        case HAIR_GRID:
            downloadImage(imgView: img_avatarHair, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupHair, buttonId: sender.tag)
            myAvatar?.hairID = piecesGrid[listPart][posInList].id
            break
            
        case EYES_GRID:
            downloadImage(imgView: img_avatarEyes, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupEyes, buttonId: sender.tag)
            myAvatar?.eyesID = piecesGrid[listPart][posInList].id
            break
            
        case MOUTH_GRID:
            downloadImage(imgView: img_avatarMouth, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupMouth, buttonId: sender.tag)
            myAvatar?.mouthID = piecesGrid[listPart][posInList].id
            break
            
        case ACCESSORIES_GRID:
            downloadImage(imgView: img_avatarAcc, urlImage: piecesGrid[listPart][posInList].icon)
            updateStateButtons(radioGroup: radioGroupAcc, buttonId: sender.tag)
            myAvatar?.accID = piecesGrid[listPart][posInList].id
            break
            
        default:
            break
        }
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
        // Verifica que se hayan seleccionado todas las partes del avatar
        guard myAvatar?.skinID != nil, myAvatar?.hairID != nil, myAvatar?.eyesID != nil,
            myAvatar?.mouthID != nil, myAvatar?.accID != nil else {
            self.showErrorMessage(withMessage: Strings.error_message_avatarIncomplete)
            return
        }
        
        // Crea una imagen combinado todas las partes y la guarda en el dispositivo y enel runtime
        let avatar = UIImage.combine(images: img_avatarSkin.image!, img_avatarEyes.image!, img_avatarMouth.image!, img_avatarHair.image!, img_avatarAcc.image!)
        
        AplicationRuntime.sharedManager.setAvatarImage(img: avatar)
        AplicationRuntime.sharedManager.setAvatarPieces(avatarPieces: myAvatar!)
        
        StorageFunctions.saveAvatarImage(image: avatar)
        StorageFunctions.saveAvatarInLocal(avatarPieces: myAvatar!)
        
        performSegue(withIdentifier: segueID.showAvatar, sender: self)
    }
}
