//
//  Untils.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import UIKit

func hiddenView(view id: IdView, state: Bool) -> CGFloat {
    
    switch id {
        
    case .NCR_DATA:
        return state ? ConseValues.notHeight : ConseValues.dataNCRHeight
        
    default:
        return ConseValues.notHeight
    }
}

/**
 Modifica el titulo del botón <Back>, por uno de entrada
 
 - Parameter vc: Controlador desde donde se va a hacer el cambio
 - Parameter title: Texto que se desea poner como titulo
 */
func setBackTitle(forViewController vc: UIViewController, title: String){
    
    let backItem = UIBarButtonItem()
    backItem.title = title
    
    vc.navigationItem.backBarButtonItem = backItem
}

func printDebugMessage(tag: String) {
    #if DEBUG
        print("\(debugFlag) \(tag)")
    #else
        return
    #endif
}

class Validations {
    
    // Valida que se halla escrito alguna fecha
    class func isValidDate(birthDate: String!, controller: UIViewController) -> Bool {
        guard !birthDate.isEmpty, birthDate.uppercased() != Strings.birthday_placeholder.uppercased() else {
            controller.showErrorMessage(withMessage: Strings.error_message_requieredData)
            return false
        }
        return true
    }
    
    // Valida que el label no este lleno y no tenga la informacion por defecto
    class func isValidData(fromField lbl: UILabel, controller: UIViewController) -> Bool {
        guard !(lbl.text?.isEmpty)!, lbl.text?.uppercased() != Strings.texfiled_placeholder.uppercased() else {
            controller.showErrorMessage(withMessage: Strings.error_message_requieredData)
            return false
        }
        return true
    }
    
    // Valida que los campos de texto no esten vacios
    class func isValidData(fromField textField: UITextField, controller: UIViewController) -> Bool {
        guard !(textField.text?.isEmpty)!, textField.text != blankSpace else {
            controller.showErrorMessage(withMessage: Strings.error_message_requieredData)
            return false
        }
        return true
    }
    
    // Valida que el formato de email sea correcto
    class func isValidEmail(email:String, controller: UIViewController) -> Bool {
        let emailTest = NSPredicate(format: Formats.matchesFormat, Formats.emailRegEx)
        guard emailTest.evaluate(with: email) else {
            controller.showErrorMessage(withMessage: Strings.error_message_invalidEmail)
            return false
        }
        return true
    }
    
    // Valida que el formato de contraseña sea el correcto
    class func isValidPass(pass:String, controller: UIViewController) -> Bool {
        let pswd = NSPredicate(format: Formats.matchesFormat, AplicationRuntime.sharedManager.getPswRegex())
        guard pswd.evaluate(with: pass) else {
            controller.showErrorMessage(withMessage: AplicationRuntime.sharedManager.getPswErrorMessage())
            return false
        }
        return true
    }
}

extension UIViewController {
    
    func showLoader(withMessage msn:String!) {
        
        guard msn != nil else { return }
        
        let sb = UIStoryboard(name: StoryboardsId.main, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.loader) as! LoaderViewController
        
        nextVC.loaderText = msn
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    func showErrorMessage(withMessage msn:String, title:String? = nullString) {
        
        let alert = UIAlertController(title: title, message: msn, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Strings.button_accept, style: .cancel) {(_) in
            alert.dismiss(animated: false, completion: nil)
        }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// extención paro los tap gesture
extension UITapGestureRecognizer {
    
    // http://samwize.com/2016/03/04/how-to-create-multiple-tappable-links-in-a-uilabel/
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y)
        
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
