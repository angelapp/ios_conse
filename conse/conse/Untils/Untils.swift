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

func getBirthdateString(inFormat format: String, fromDate date: String, withFormat currentFormat: String) -> String {
    
    let currentDateFormatter = DateFormatter()
    currentDateFormatter.dateFormat = currentFormat
    let currentDate = currentDateFormatter.date(from: date)
    
    let newDateFormatter = DateFormatter()
    newDateFormatter.dateFormat = format
    
    return newDateFormatter.string(from: currentDate!)
}

func hiddenView(view id: IdView, state: Bool) -> CGFloat {
    
    switch id {
        
    case .NCR_DATA:
        return state ? ConseValues.defaultHeight : ConseValues.dataNCRHeight
        
    default:
        return ConseValues.defaultHeight
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

// MARK: - Styles functions
/// Resalta en el texto la palabra de entrada
func addBoldWord(forText text: String, toWord words: String..., fontSize size: CGFloat) -> NSAttributedString {
    
    let attributeText = NSMutableAttributedString(string: text)
    let boldFontAttribute = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: size)]
//    let italicFontAttribute = [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: size)]
    
    for word in words {
        let range = (text as NSString).range(of: word)
        attributeText.addAttributes(boldFontAttribute, range: range)
    }
    
    return attributeText
}

/// Change font color and add underline
/// - Parameter text: Text to apply style
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

// MARK: - Transform Functions
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

func arrayTransform(from tempArray: Array<Any>) -> Array<OrganizationType> {
    var arrayModel: Array<OrganizationType> =  []
    
    for value in tempArray {
        let model = Mapper<OrganizationType>().map(JSON: value as! [String: Any])
        arrayModel.append(model!)
    }
    
    return arrayModel
}

func arrayTransform(from tempArray: Array<Any>) -> Array<NewsCategory> {
    var arrayModel: Array<NewsCategory> =  []
    
    for value in tempArray {
        let model = Mapper<NewsCategory>().map(JSON: value as! [String: Any])
        arrayModel.append(model!)
    }
    
    return arrayModel
}

/// Guarda en local la fecha de finalización de una actividad.
/// - Parameter activity: Modelo con los datos de la actividad a guardar (id_curso, id_modulo, abreviatura, fecha)
/// - Returns: Verdadero, si puede guardar la fecha, False si ya se ha completado o no se puede realizar la acción
func saveProgress(forActivity activity: ActityCompleted) -> Array<RequestCompleted>! {
    
    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array
    
    // Busca el curso al que pertenece la actividad
    for course in courses! {
        if course.id == activity.courseID {
            
            // Obtiene la lista de actividades, para un determinado modulo
            if let activies = course.course_topics[activity.topicID].topic_activity_list {
                
                // Busca la actividad que se desa guardar el progreso
                for act in activies {
                    
                    printDebugMessage(tag: "has activities \(act.abreviature) \(activity.activity)")
                    if act.abreviature == activity.activity {
                        
                        // Guarda la fecha de finalización de a actividad si esta no existe
                        if act.dateCompleted == nil || act.dateCompleted == nullString {
                            act.dateCompleted = activity.dateCompleted
                            StorageFunctions.saveActivitiesProgress(courses: CourseListModel(courseList: courses!))
                            
                            return [RequestCompleted(user: AplicationRuntime.sharedManager.getUser().id,
                                                                                                 activity: act.id,
                                                                                                 date: activity.dateCompleted)]
                        }
                        else {
                            return nil
                        }
                    }
                }
            }
        }
    }
    
    // Retorno por defecto
    return nil
}

func getProgress(forCourse index: Int) -> Array<ModuleProgressItem> {
    
    let imageComplet = [ProgressStrings.image_begginer, ProgressStrings.image_expert, ProgressStrings.image_advanced, ProgressStrings.image_star]
    let imageIncomplet = [ProgressStrings.image_begginer_off, ProgressStrings.image_expert_off, ProgressStrings.image_advanced_off, ProgressStrings.image_star_off]
    
    // Carga los titulos de acuerdo al genero del usuario
    let titles = [getInsignia(forModule: .MOD_01), getInsignia(forModule: .MOD_02), getInsignia(forModule: .MOD_03), getInsignia(forModule: .MOD_04)]
    
    let courses = StorageFunctions.loadActivitiesProgress() ?? AplicationRuntime.sharedManager.getAppConfig()?.course_Array
    var progress: Array<ModuleProgressItem> = []
    
    // Busca el curso al que pertenece la actividad
    for course in courses! {
        
        if course.id == index {
            // Obtiene la lista de actividades, para un determinado modulo
            if let topics = course.course_topics {
                
                // Avanza por los modulos del
                var topicPos = 0
                for topic in topics {
                    
                    var activitiesCompleted: Float = 0.0
                    for activity in topic.topic_activity_list {
                        if activity.dateCompleted != nil && activity.dateCompleted != nullString {
                            activitiesCompleted += 1
                        }
                    }
                    
                    let progressValue: Float = activitiesCompleted / Float(topic.topic_activity_list.count)
                    let imgTrophy = (progressValue == 1) ? imageComplet[topicPos] : imageIncomplet[topicPos]
                    progress.append(ModuleProgressItem(image: imgTrophy, title: titles[topicPos], progress: progressValue))
                    topicPos += 1
                }
            }
        }
    }
    
    return progress
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
    class func isValidDate(birthDate: String!, errorView: UILabel? = nil) -> Bool {
        guard !birthDate.isEmpty, birthDate.uppercased() != Strings.birthday_placeholder.uppercased() else {
            errorView?.text = ErrorStrings.requiredField
            return false
        }
        
        errorView?.text = nullString
        return true
    }
    
    // Valida que el label no este lleno y no tenga la informacion por defecto
    class func isValidData(fromPromt lbl: UILabel, errorView: UILabel? = nil) -> Bool {
        guard !(lbl.text?.isEmpty)!, lbl.text?.uppercased() != Strings.texfiled_placeholder.uppercased() else {
            errorView?.text = ErrorStrings.requiredField
            return false
        }
        
        errorView?.text = nullString
        return true
    }
    
    // Valida que los campos de texto no esten vacios
    class func isValidData(fromField textField: UITextField, errorView: UILabel? = nil) -> Bool {
        guard !(textField.text?.isEmpty)!, textField.text != blankSpace else {
            errorView?.text = ErrorStrings.requiredField
            return false
        }
        
        errorView?.text = nullString
        return true
    }
    
    // Valida que el formato de email sea correcto
    class func isValidEmail(email:String, errorView: UILabel? = nil) -> Bool {
        let emailTest = NSPredicate(format: Formats.matchesFormat, Formats.emailRegEx)
        guard emailTest.evaluate(with: email) else {
            errorView?.text =  ErrorStrings.invalidEmail
            return false
        }
        
        errorView?.text = nullString
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

// MARK: - Extensions
extension UIViewController {
    
    //Action of the returnKey in texField
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
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
    
    /// Show Alert with message
    func showErrorMessage(withMessage msn:String, title:String? = nullString) {
        
        let alert = UIAlertController(title: title, message: msn, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Strings.button_accept, style: .cancel) {(_) in
            alert.dismiss(animated: false, completion: nil)
        }
        
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    /// Show Alert for open settings
    /// - Paramenter seting: string with setting path
    func showSettingsPopup(title: String, message: String, settings: String) {
        let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: Strings.button_settings, style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: settings) else { return }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
        let cancelAction = UIAlertAction(title: Strings.button_cancel, style: .cancel, handler: nil)
        
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showEmergencyPopup(senderVC: ViewControllerTag, testDelegate: TestAlertProtocol? = nil) {
        
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.emergencyPopup) as! EmergencyPopupViewController
        
        nextVC.senderVC = senderVC
        nextVC.testAlertDelegate = testDelegate
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    func makeCall(forNumber line: String) {
        
        let number = line.components(separatedBy: .whitespaces).joined()
        
        if let url = URL(string: String(format: Formats.callFormat, number)), UIApplication.shared.canOpenURL(url) {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            showErrorMessage(withMessage: ErrorStrings.disabledAction)
        }
    }
}

// Link action as tapGesture
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

// Extension para el table view
extension UITableView {
    
    /** Crea animación desaparecer, aparecer para indicar que se a actualizado la tabla
     */
    func animate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 1
            })
        }
    }
}

// Extension for array
extension Array {
    
    /// Get array without duplicate elements
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        
        return arrayOrdered
    }
}
