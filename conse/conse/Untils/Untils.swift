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
}
