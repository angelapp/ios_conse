//
//  Styles.swift
//  conse
//
//  Created by Felipe Zamudio on 2/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     Add radius
     
     - Parameter radius: The radius to use when drawing rounded corners for the layer’s background
     */
    func addRadius(radius: CGFloat){
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    /**
     Agreaga un borde inferior  a la vista que lo este lamando
     
     - Parameter margin: (Optional) value for rigth and left margin
     - Parameter padding: (Optional) value for rigth and left padding as width screen porcentage
     */
    func underline(margin: CGFloat? = nil, padding: CGFloat? = nil, color: UIColor? = .gray) {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        let padding = self.frame.size.width * (padding ?? 0)
        let width = UIScreen.main.bounds.width - ((margin ?? 0) * 2)
        
        border.borderColor = color?.cgColor
        border.frame = CGRect(x: ConseValues.defaultPositionX + padding,
                              y: self.frame.size.height - borderWidth,
                              width:  width - (padding * 2),
                              height: self.frame.size.height)
        
        border.borderWidth = borderWidth
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIButton {
    
    func rounder(){
        self.addRadius(radius: (self.frame.size.height / 2))
    }
}
