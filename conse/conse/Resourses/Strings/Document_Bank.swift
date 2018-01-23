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

struct MyCommunityStrings {
    static let leadersFile = "auditoria_lideres"
    static let vbgFile = "auditoria_vbg"
    
    static let leadersTitle = "Auditoría de seguridad de Violencia Basada en Género"
    static let vbgTitle = "Evaluación de riesgos de protección para líderes y lideresas"
    
    static let leadersObjective = "Objetivo: Reducir los riesgos de violencia en líderes y lideresas comunitarias"
    static let vbgObjective = "Objetivo: Reducir los riesgos de violencia basadas en género"
    
    static let note = "Nota: Esta herramineta está basada en la observación. Puede ser o no relevante en deterinados contexts. En áreas de inseguridad, no debe completar este cuestionario caminando por la comunidad; se recomienda observar y retener la información mentalamnete, para posteriormente completar el formato en un lugar seguro."
    static let downloadCopy = "Descargue o comparta la auditoría"
}

struct FileExtensions {
    static let PDF = ".pdf"
    static let DOC = ".docx"
}

func getMyCommunityDocuments() -> Array<MyCommunityItem> {
    var array:Array<MyCommunityItem> = []
    
    array.append(MyCommunityItem(title: MyCommunityStrings.vbgTitle,
                                objective: MyCommunityStrings.vbgObjective,
                                note: MyCommunityStrings.note,
                                downloadCopy: MyCommunityStrings.downloadCopy,
                                file: MyCommunityStrings.vbgFile,
                                ext: FileExtensions.PDF))
    
    array.append(MyCommunityItem(title: MyCommunityStrings.leadersTitle,
                                objective: MyCommunityStrings.leadersObjective,
                                note: MyCommunityStrings.note,
                                downloadCopy: MyCommunityStrings.downloadCopy,
                                file: MyCommunityStrings.leadersFile,
                                ext: FileExtensions.PDF))
    
    return array
}

func getFormatList() -> Array<FormatsBankItem>! {
    
    var list: Array<FormatsBankItem>! = []
    
    list.append(FormatsBankItem(name: DocBank_Formats.label_ATutela, file: DocBank_Formats.doc_ATutela, ext: FileExtensions.DOC))
    list.append(FormatsBankItem(name: DocBank_Formats.label_DP_Alcadias, file: DocBank_Formats.doc_DP_Alcadias, ext: FileExtensions.DOC))
    list.append(FormatsBankItem(name: DocBank_Formats.label_DP_UNP, file: DocBank_Formats.doc_DP_UNP, ext: FileExtensions.DOC))
    list.append(FormatsBankItem(name: DocBank_Formats.label_UNP_rutaPC, file: DocBank_Formats.doc_UNP_rutaPC, ext: FileExtensions.PDF))
    list.append(FormatsBankItem(name: DocBank_Formats.label_UNP_PI, file: DocBank_Formats.doc_UNP_PI, ext: FileExtensions.PDF))
    list.append(FormatsBankItem(name: DocBank_Formats.label_recursoRepApe, file: DocBank_Formats.doc_recursoRepApe, ext: FileExtensions.DOC))
    
    return list
}
