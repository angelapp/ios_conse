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
     Crea una capa para agregar una linea inferior y una linea top
     
     - Parameter margin: (Optional) Valor del espacio entre la visa y el borde de pantalla
     - Parameter padding: (Octional) Porcentage de espacio entre el border de la vista y la capa. Su valor por defecto es 0, admite valores entre 0 - 0.25
     - Parameter color: (Opcional) Color de la linea, por defecto es gris
     - Parameter withTop: (Opcional) Boleano, determina si se debe poner linea top, por defecto esta en FALSO
     */
    func underline(margin: CGFloat? = nil, padding: CGFloat? = 0.0, color: UIColor? = .gray, withTop: Bool? = false) {
        
        // Verifica que los valores esten dentro de un rango porcentual,
        // es decir, entre (0 - 1)
        let minPadding: CGFloat = 0.0
        let maxPadding: CGFloat = 0.25
        var porcentage: CGFloat = (padding ?? 0)
        
        porcentage = porcentage > maxPadding ? maxPadding : porcentage
        porcentage = porcentage < minPadding ? minPadding : porcentage
        
        // Crea capa linea inferior
        let border = CALayer()
        // Grueso del borde
        let borderWidth = CGFloat(1.0)
        // Determina el ancho de borde (tamaño de pantalla - (marge * 2))
        // Margen = Constraint Izq / Der
        let width = UIScreen.main.bounds.width - ((margin ?? 0) * 2)
        // porcentage del ancho que no va con linea
        let borderPadding = width * porcentage
        
        // Color del borde
        border.borderColor = color?.cgColor
        // Se crea el frame del borde
        border.frame = CGRect(x: ConseValues.defaultPositionX + borderPadding,
                              y: self.frame.size.height - borderWidth,
                              width:  width - (borderPadding * 2),
                              height: self.frame.size.height)
        // Se agrega el grosor del borde
        border.borderWidth = borderWidth
        
        // Se crea nueva capa para agregar linea top si se requiere
        if withTop! {
            let top = CALayer()
            
            top.borderColor = color?.cgColor
            top.frame = CGRect(x: ConseValues.defaultPositionX + borderPadding,
                                  y: ConseValues.defaultPositionY,
                                  width:  width - (borderPadding * 2),
                                  height: borderWidth)
            
            top.borderWidth = borderWidth
            self.layer.addSublayer(top)
        }
        
        // Se agrega la nueva capa a la vista
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

//Extensión para poner "linea piso - Underline" a un textFiel
extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIButton {
    
    func rounder(){
        self.addRadius(radius: (self.frame.size.height / 2))
    }
}
