//
//  TabButtonsCollectionViewCell.swift
//  conse
//
//  Created by Felipe Zamudio on 27/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

/**
 Clase para administrar las pestañas de las paginas que lo requieran
 */

import UIKit

class TabButtonsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var tab_button: UIButton!
    @IBOutlet weak var underline: UIView!
    
    // MARK: - Properties
    // Protocolos de las clases que pueden hacer uso de la celda
    // Se usan para actualizar la vista padre
    
//    var aboutNRCTabDelegate: AboutNRCTabProtocol? // Protocolo para las pestañas de "Sobre NRC"
    var documentsTabDelegate: DocumentsTabProtocol? // Protocolo para las pestañas de "Documentos"
//    var leadersRoutesTabDelegate: LeadersRouteTabProtocol? // Protocolo para las pestañas de "Rutas de protecion para líderes"
//    var progressTabDelegate: ProgressTabProtocol? // Protocolo para las pestañas de "Progreso Cursos"
//    var vbgRoutesTabDelegate: LeadersRouteTabProtocol? // Protocolo para las pestañas de "Rutas de protecion Violencia Basada en Genero"
    
    // MARK: - Functions
    func setButtonTitle(title: String) {
        tab_button.setTitle(title, for: .normal)
        tab_button.setTitle(title, for: .highlighted)
        tab_button.setTitle(title, for: .selected)
    }
    
    // MARK: - Actions
    /** Actualizar la vista en el controlador padre atravez del uso del protocolo
     que este activo, es decir, que no sea nulo */
    @IBAction func actionButton(_ sender: UIButton){
//        aboutNRCTabDelegate?.changeTabSelected(toPosition: tab_button.tag, animated: true)
        documentsTabDelegate?.changeTabSelected(toPosition: tab_button.tag)
//        leadersRoutesTabDelegate?.changeTabSelected(toPosition: tab_button.tag, animated: true)
//        progressTabDelegate?.changeTabSelected(toPosition: tab_button.tag, animated: true)
//        vbgRoutesTabDelegate?.changeTabSelected(toPosition: tab_button.tag, animated: true)
    }
}
