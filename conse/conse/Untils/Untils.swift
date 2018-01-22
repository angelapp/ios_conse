//
//  Untils.swift
//  conse
//
//  Created by Felipe Zamudio on 3/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import AlamofireImage
import Foundation
import UIKit
import ObjectMapper

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

/// Descargar la imagen y la carga al imageView
func downloadImage(imgView: UIImageView, urlImage: String!) {
    
    if urlImage != nil, let dowloadURL = NSURL(string: urlImage) {
        imgView.af_setImage(withURL: dowloadURL as URL)
    }
}

/// Resalta en el texto la palabra de entrada
func addBoldWord(forText text: String, toWord words: String..., fontSize size: CGFloat) -> NSAttributedString {
    
    let attributeText = NSMutableAttributedString(string: text)
    let boldFontAttribute = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: size)]
    
    for word in words {
        let range = (text as NSString).range(of: word)
        attributeText.addAttributes(boldFontAttribute, range: range)
    }
    
    return attributeText
}

func addLinkStyle(forText text: String) -> NSAttributedString {
    
    let range = (text as NSString).range(of: text)
    let textAttributed = NSMutableAttributedString(string: text)
    let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
    let colorAttribute = [NSAttributedStringKey.foregroundColor: Colors().getColor(from: ConseColors.salmon.rawValue)]
    
    textAttributed.addAttributes(underlineAttribute, range: range)
    textAttributed.addAttributes(colorAttribute, range: range)
    
    return textAttributed
}

/// Escala la imagen dentro del botón con AspectFit
func setAspectFitToButton(buttons: UIButton...){
    for button in buttons {
        button.imageView?.contentMode = .scaleAspectFit
    }
}

/// convierte JSONString en diccionario
func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

/**
 Mapea los elementos de un array genérico a un modelo de tipo Notificación
 - Parameter tempArray: Arreglo temporal que debe ser transformado
 - Returns: Arreglo casteado
 */
func arrayTransform(from tempArray: Array<Any>) -> Array<DocumentTextType> {
    var arrayModel: Array<DocumentTextType> =  []
    
    for value in tempArray {
        let model = Mapper<DocumentTextType>().map(JSON: value as! [String: Any])
        arrayModel.append(model!)
    }
    
    return arrayModel
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
        
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
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
    
    func showCallEmergency() {
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.emergencyCallPopup) as! EmergencyCallPopupViewController
        
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    func makeCallEmergency(toEmergencyLine line: String){
        let number = line.components(separatedBy: .whitespaces).joined()
        if let url = URL(string: String(format: Formats.callFormat, number)), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            showErrorMessage(withMessage: Strings.error_message_notAvailableAction)
        }
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

extension UIImage {
    
    // Combiana las imagenes de entrada para generar una única imagen
    class func combine(images: UIImage...) -> UIImage {
        var contextSize = CGSize.zero
        
        for image in images {
            contextSize.width = max(contextSize.width, image.size.width)
            contextSize.height = max(contextSize.height, image.size.height)
        }
        
        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.main.scale)
        
        for image in images {
            let originX = (contextSize.width - image.size.width) / 2
            let originY = (contextSize.height - image.size.height) / 2
            
            image.draw(in: CGRect(x: originX, y: originY, width: image.size.width, height: image.size.height))
        }
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return combinedImage!
    }
}

extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
}
