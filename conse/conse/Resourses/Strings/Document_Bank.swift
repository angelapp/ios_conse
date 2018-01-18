//
//  Document_Bank.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

struct DocBank_Formats {
    static let doc_ATutela = "accion_de_tutela"
    static let doc_DP_Alcadias = "derecho_de_peticion_alcaldias_y_gobernaciones" // derecho de petición   alcaldias y gobernaciones
    static let doc_DP_UNP = "derecho_de_peticion_unp" // derecho de petición   UNP
    static let doc_UNP_rutaPC = "formulario_inscripcion_unp_para_ruta_proteccion_colectiva"
    static let doc_UNP_PI = "formulario_inscripcion_unp_proteccion_individual"
    static let doc_recursoRepApe = "recurso_de_reposicion_y_apelacion"
    
    static let label_ATutela = "Acción de tutela"
    static let label_DP_Alcadias = "Derecho de petición Alcaldias y Gobernaciones" // derecho de petición   alcaldias y gobernaciones
    static let label_DP_UNP = "Derecho de petición UNP" // derecho de petición   UNP
    static let label_UNP_rutaPC = "Formulario inscripción UNP para Ruta Protección Colectiva"
    static let label_UNP_PI = "Formulario inscripción UNP Protección Individual"
    static let label_recursoRepApe = "Recurso de Reposición y Apelacion"
}

func getFormatList() -> Array<FormatsBankItem>! {
    
    var list: Array<FormatsBankItem>! = []
    
    list.append(FormatsBankItem(label: DocBank_Formats.label_ATutela, doc: DocBank_Formats.doc_ATutela))
    list.append(FormatsBankItem(label: DocBank_Formats.label_DP_Alcadias, doc: DocBank_Formats.doc_DP_Alcadias))
    list.append(FormatsBankItem(label: DocBank_Formats.label_DP_UNP, doc: DocBank_Formats.doc_DP_UNP))
    list.append(FormatsBankItem(label: DocBank_Formats.label_UNP_rutaPC, doc: DocBank_Formats.label_UNP_rutaPC))
    list.append(FormatsBankItem(label: DocBank_Formats.label_UNP_PI, doc: DocBank_Formats.doc_UNP_PI))
    list.append(FormatsBankItem(label: DocBank_Formats.label_recursoRepApe, doc: DocBank_Formats.doc_recursoRepApe))
    
    return list
}
