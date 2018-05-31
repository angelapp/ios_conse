//
//  TabsForSections.swift
//  conse
//
//  Created by Felipe Zamudio on 27/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

/// Nombre de las pesañas organizadas por secciones
struct TabsName {
   
    struct AboutNRCTabs {
        static let tab_01 = "QUIÉNES SOMOS"
        static let tab_02 = "QUÉ HACEMOS"
        static let tab_03 = "DÓNDE TRABAJAMOS"
    }
    
    struct DocumentsTabs {
        static let tab_01 = "BANCO DE FORMATOS"
        static let tab_02 = "MARCO JURÍDICO"
        static let tab_03 = "ESCUDOS DE PROTECCIÓN"
    }
    
    struct LeadersRoutesTabs {
        static let tab_01 = "RUTA INDIVIDUAL"
        static let tab_02 = "RUTA COLECTIVA"
        static let tab_03 = "VIDEO 1"
        static let tab_04 = "VIDEO 2"
    }
    
    struct ProgressTabs {
        static let tab_01 = "Violencia Basada en Género"
        static let tab_02 = "Protección de líderes y lideresas"
    }
    
    struct VBGRoutesTabs {
        static let tab_01 = "RUTA VBG"
        static let tab_02 = "VIDEO"
    }
}

// MARK: - Funciones para retornar las pestañas de una vista
/**
 Retorna una lista, con los nombres de las pestañas de una vista en particular.
 
 - Parameter forVieID: Id de la vista padre que contendra las pestañas
 - Returns: Cadena con los titulos de las respectivas pestañas
 */
func getTabs(forViewID id: ViewControllerTag) -> [String] {
    
    switch id {
        
    case .aboutUs:
        return [TabsName.AboutNRCTabs.tab_01, TabsName.AboutNRCTabs.tab_02, TabsName.AboutNRCTabs.tab_03]
        
    case .documentBank:
        return [TabsName.DocumentsTabs.tab_01, TabsName.DocumentsTabs.tab_02, TabsName.DocumentsTabs.tab_03]
        
    case .leadersRoute:
        return [TabsName.LeadersRoutesTabs.tab_01, TabsName.LeadersRoutesTabs.tab_02,
                TabsName.LeadersRoutesTabs.tab_03, TabsName.LeadersRoutesTabs.tab_04]
        
    case .progress:
        return [TabsName.ProgressTabs.tab_01, TabsName.ProgressTabs.tab_02]
        
    case .vbgRoute:
        return [TabsName.VBGRoutesTabs.tab_01, TabsName.VBGRoutesTabs.tab_02]
        
    default:
        return [nullString]
    }
}



