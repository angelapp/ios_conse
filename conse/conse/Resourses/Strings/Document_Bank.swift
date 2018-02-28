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
    
    static let leadersTitle = "Evaluación de riesgos de protección para líderes y lideresas"
    static let vbgTitle = "Auditoría de seguridad de Violencia Basada en Género"
    
    static let leadersMessage = "A continuación, te brindamos una herramienta para analizar los riesgos de protección que enfrentan líderes y lideresas en tu comunidad.\n\nEsta herramienta está basada en la observación.\n\nSi tu comunidad es muy insegura, no deberías completar este cuestionario caminando. En ese caso, se recomienda observar y retener información mentalmente, para posteriormente completar el formato en un lugar seguro.\n\nA través de esta herramienta puedes obtener información acerca de tu comunidad en los siguientes aspectos: características generales, acceso a servicios básicos, salud, alimentación, seguridad, presencia institucional.\n\nUna vez completes la herramienta, podrás utilizarla para trabajar con tu comunidad, así como con autoridades, organizaciones humanitarias, agencias de Naciones Unidas, ONGs en acciones de prevención y mitigación de riesgos.\n\nAsí mismo, podrá serte útil para hacer incidencia ante los funcionarios públicos y gestionar recursos, medidas de protección individuales y colectivas, proyectos y programas especiales que permitan disminuir los riesgos de protección que enfrentan líderes y lideresas.\n\nPasos a seguir:\n1) Descarga e imprime la herramienta\n2) Observa y responde las preguntas\n3) ¡Ahora tienes un mejor panorama sobre los riesgos de protección en tu comunidad!"
    static let vbgMessage = "A continuación, te brindamos una herramienta para analizar los riesgos de violencia basada en género para mujeres y niñas en tu comunidad. \n\nEsta herramienta está basada en la observación. \n\nSi tu comunidad es muy insegura, no deberías completar este cuestionario caminando. En ese caso, se recomienda observar y retener información mentalmente, para posteriormente completar el formato en un lugar seguro.\n\nA través de esta herramienta puedes obtener información acerca de tu comunidad en los siguientes aspectos: características generales, acceso a servicios básicos, salud, alimentación, seguridad, presencia institucional.\n\nUna vez completes la herramienta, podrás utilizarla para trabajar con tu comunidad, así como con autoridades, organizaciones humanitarias, agencias de Naciones Unidas, ONGs en acciones de prevención y mitigación de riesgos.\n\nAsí mismo, podrá serte útil para hacer incidencia ante los funcionarios públicos y gestionar recursos, proyectos y programas especiales que permitan disminuir los riesgos de protección que enfrentan mujeres y niñas.\n\nPasos a seguir:\n\n1) Descarga e imprime la herramienta\n2) Observa y responde las preguntas\n3) ¡Ahora tienes un mejor panorama sobre los riesgos en tu comunidad!"
    
    static let leadersObjective = "¿Has analizado los riesgos de protección que corren líderes y lideresas en tu comunidad?"
    static let vbgObjective = "¿Te has detenido a analizar los riesgos que corren las niñas y mujeres de tu comunidad?"
    
    static let note = "Nota: Esta herramineta está basada en la observación. Puede ser o no relevante en deterinados contexts. En áreas de inseguridad, no debe completar este cuestionario caminando por la comunidad; se recomienda observar y retener la información mentalamnete, para posteriormente completar el formato en un lugar seguro."
    
    static let downloadCopy = "Descargue o comparta la auditoría"
}

struct FileExtensions {
    static let PDF = ".pdf"
    static let DOC = ".docx"
}

/// Make a list of My Cominity items
func getMyCommunityDocuments() -> Array<MyCommunityItem> {
    var array:Array<MyCommunityItem> = []
    
    array.append(MyCommunityItem(title: MyCommunityStrings.vbgTitle,
                                 objective: MyCommunityStrings.vbgObjective,
                                 note: MyCommunityStrings.vbgMessage,
                                 downloadCopy: MyCommunityStrings.downloadCopy,
                                 file: MyCommunityStrings.vbgFile,
                                 ext: FileExtensions.PDF))
    
    array.append(MyCommunityItem(title: MyCommunityStrings.leadersTitle,
                                 objective: MyCommunityStrings.leadersObjective,
                                 note: MyCommunityStrings.leadersMessage,
                                 downloadCopy: MyCommunityStrings.downloadCopy,
                                 file: MyCommunityStrings.leadersFile,
                                 ext: FileExtensions.PDF))
    
    return array
}

/**
 Get format list like array of FormatBankItem
 Create each item like an object with title to show, name in device and extension 
*/
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
