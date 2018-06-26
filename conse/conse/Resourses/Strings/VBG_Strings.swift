//
//  VBG_Strings.swift
//  conse
//
//  Created by Felipe Zamudio on 16/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//
//
// Contiene todos los textos del curso "Atención y prevención de Violencia Basada en Género "
// El contenido, esta separado por Páginas del curso.


import Foundation

struct VBG_COURSE {
    
    static let correct_answer = "¡Muy bien, \nrespuesta correcta!"
    
    // MARK: - Module 01
    struct PAGE_01 {
        static let T1 = "Atención y Prevención \nde Violencia \nBasada en Género"
        static let T2 = "Recibe la bienvenida al curso, prepárate para conocer la respuesta a preguntas como: ¿Qué es violencia de género?, ¿Todas las violencias son iguales?, ¿Dónde puedo encontrar ayuda? ¡Adelante! ¡Inicia el recorrido y resuelve tus dudas!"
    }
    
    struct PAGE_02 {
        static let T1 = "¿Qué son las Violencias Basadas en Género?"
        static let T2 = "Guía divulgadora de derechos. Guía para el abordaje pedagógico de los derechos de las mujeres y de personas con orientaciones sexuales e identidades de género no hegemónicas. CONSEJERÍA PRESIDENCIAL PARA LA EQUIDAD DE LA MUJER, USAID, OIM"
        static let T2_inBold_01 = "Guía para el abordaje pedagógico"
        static let T2_inBold_02 = "CONSEJERÍA PRESIDENCIAL PARA LA EQUIDAD DE LA MUJER, USAID, OIM"
        static let T3 = "La VBG puede ser ejercida contra personas que no se adecuan a lo esperado por la sociedad según su sexo, como es el caso de personas con orientación sexual diversa (gays, lebianas, y bisexuales) o con identidad de género diversa (transexuales), pero se ejerce principalmente contra mujeres, niñas y adolecentes, de allí que cuando se hable de violencia de género, se asocie mayormente con violencia contra las mujeres"
        static let T4 = "¡Ahora sí! Estamos listos para iniciar ¡Adelante!"
    }
    
    struct PAGE_03 {
        static let T1 = "Módulo 1"
        static let T2 = "¿Cómo saber si soy víctima de violencia?"
        static let T3 = "El primer paso para identificar si eres víctima de violencia es tener claro ¿qué se entiende por violencia contra las mujeres?"
        static let T4 = "La ley define la violencia contra las mujeres como:"
        static let T5 = "\"Cualquier acción u omisión, que le cause muerte, daño o sufrimiento físico, sexual, psicológico, económico o patrimonial por su condición de mujer, así como las amenazas de tales actos, la coacción o la privación arbitraria de la libertad, bien sea que se presente en el ámbito público o privado\"."
        static let T6 = "(Ley 1257/08, art.2)"
    }
    
    struct PAGE_04 {
        static let TITLE = "¿Cómo saber si soy víctima de violencia?"
        static let T1 = "Según la ley, la violencia contra las mujeres presenta las siguientes características:"
        static let ITEM_1 = "Te ocurre por ser mujer. Esto significa que ser mujer es lo que te pone en riesgo."
        static let ITEM_2 = "Te puede ocurrir a ti o a cualquier mujer, no hay excepciones."
        static let ITEM_3 = "Es un delito y por lo tanto merece un castigo o pena."
        static let ITEM_4 = "Puede ocasionarte un daño, sufrimiento o muerte. También incluye las amenazas de cometer esos hechos."
        static let ITEM_5 = "Se puede presentar en cualquier tipo de espacio público o privado donde desarrolles tus actividades."
    }
    
    struct PAGE_05 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let SUBTITLE = "Conoce cada uno de los ámbitos donde se presenta la violencia."
        static let T1 = "Pulsa sobre el triángulo dentro del círculo para escuchar la descripción de cada uno de los ámbitos:"
        static let AUDIO_1 = "En la familia"
        static let AUDIO_2 = "En la comunidad"
        static let AUDIO_3 = "En el ámbito estatal"
        static let AUDIO_4 = "En el conflicto armado"
    }
    
    struct PAGE_06 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let T1 = "Si crees ser víctima de violencia en el marco del conflicto armado hay varios factores adicionales que debes tener en cuenta, revisa la siguiente infografía con información sobre el tema:"
        static let T2 = "La Corte Constitucional reconoció que las mujeres, por su condición de mujeres, en el conflicto armado enfrentan riesgos diferentes a los que viven los hombres. Estos son:"
        static let ITEM_1 = "Violencia sexual, explotación sexual o abuso sexual."
        static let ITEM_2 = "Esclavización o explotación para realizar roles considerados como femeninos y labores de la casa como cocinar, lavar o cuidar enfermos."
        static let ITEM_3 = "Reclutamiento forzado de tus hijos e hijas por grupos armado ilegales."
        static let ITEM_4 = "Señalamientos o venganzas por tu relación o contacto con integrantes de algún grupo armado."
        static let ITEM_5 = "Riesgos por tu labor de liderazgo o pertenencia a una organización comunitaria, social o política."
        static let ITEM_6 = "Persecución y asesinato por la imposición de normas de comportamiento relacionadas con el vestuario, horarios y relaciones personales."
        static let ITEM_7 = "Despojo de tierras y del patrimonio."
        static let ITEM_8 = "Pertenencia a una comunidad indígena o afrocolombiana."
        static let ITEM_9 = "Pérdida y ausencia del compañero o esposo durante el desplazamiento."
        static let ITEM_10 = "Explotación minera ilegal."
        static let ITEM_11 = "Identidad u orientación de género diversa."
    }
    
    struct PAGE_07 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let ITEM_1 = "Otro aspecto a tener en cuentra es que, aunque no existe un listado de hechos que se consideren violentos contra las mujeres, la ley describe que las siguientes modalidades mediante las cuales se puede manifestar violencia en cualquiera de los espacios mencionados anteriormente"
        static let T1 = "Los siguientes son los tipos de violencia a los que están expuestas las mujeres; conocerlos te puede ayudar a identificar si eres víctima. Pulsa sobre el triángulo dentro del círculo para escuchar el audio con su descripción:"
    }
    
    struct PAGE_08 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let AUDIO_1 = "Violencia física"
        static let AUDIO_2 = "Violencia sexual"
        static let AUDIO_3 = "Violencia psicológica"
        static let AUDIO_4 = "Violencia ecónomica o patrimonial"
        static let T1 = "Por último, pero no menos importante, adopta los siguientes consejos como leyes inquebrantables para tu vida diaria."
    }
    
    struct PAGE_09 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let AUDIO_1 = "Nunca olvides que..."
    }
    
    struct PAGE_10 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let T1 = "¡Buenísimo! Has finalizado tu primer módulo de formación, responde al siguiente crucigrama y recibirás tu primer reconocimiento."
    }
    
    struct PAGE_11 {
        static let T1 = "Completa el crucigrama. Pulsa sobre el número para ver la pista."
        
        static let HELP_1 = "Cuando la violencia se manifiesta mediante insultos, ataques verbales, chantajes o celos extremos, es:"
        static let HELP_2 = "Cuando la violencia se manifiesta a través del uso de la fuerza, como golpes, ahogamientos o empujones, es violencia:"
        static let HELP_3 = "Que te obliguen a tener algún tipo de comportamiento sexual no deseado, es violencia:"
        static let HELP_4 = "La violencia que se manifiesta a través del control del dinero e inasistencia alimentaria, es:"
        static let HELP_5 = "Cuando la violencia proviene del esposo, compañero permanente, padre, madre, abuelos o nietos; se le llama violencia en la:"
        static let HELP_6 = "Cuando la violencia la realiza algún integrante de un grupo armado, se denomina violencia en el Conflicto:"
        
        static let clue_1 = "psicologica"
        static let clue_2 = "fisica"
        static let clue_3 = "sexual"
        static let clue_4 = "economica"
        static let clue_5 = "familia"
        static let clue_6 = "armado"
        
        static let ERROR = "No has acertado en todas las respuestas, pero no te desanimes ¡Que sea un motivo para lograrlo en tu próximo intento!"
    }
    
    struct PAGE_12 {
        static let TITLE = VBG_COURSE.PAGE_04.TITLE
        static let T1 = "¡Buen trabajo!"
        static let T2 = "¡Es un honor concederte el título de %@!"
    }
    
    // MARK: - Module 2
    struct PAGE_13 {
        static let TITLE = "Módulo 2"
        static let SUBTITLE = "¿Qué derechos tengo?"
        static let T1 = "Ahora que sabes qué es la violencia de género, dónde se puede presentar y por parte de quién, es hora de que sepas cómo puedes protegerte. Si te reconoces como una mujer víctima de cualquier tipo de violencia, incluidas las cometidas en el conflicto armado, y decides acudir a una entidad de tu municipio en busca de ayuda, primero ten presente cuáles son tus derechos según la ley:"
        static let AUDIO_1 = "Como mujer víctima de violencia, tienes derecho a:"
    }
    
    struct PAGE_14 {
        static let TITLE = VBG_COURSE.PAGE_13.SUBTITLE
        static let T1 = "¡Muy bien! ¡Has explorado todo el contenido! Realiza la siguiente prueba y consigue el título de Consejera Experta"
    }
    
    struct PAGE_15 {
        static let TITLE = VBG_COURSE.PAGE_13.SUBTITLE
        static let T1 = "Revisa el siguiente listado y y haz clic sobre las tres opciones que consideres acertadas."
        static let T2 = "Como mujer víctima de violencia, tienes derecho a:"
        static let OPT1 = "A una atención integral, oportuna, especializada y de calidad."
        static let OPT2 = "A pasar por el proceso de conciliación, en todos los conflictos el primer paso debe ser siempre la conciliación."
        static let OPT3 = "A un trato humano, respetuoso y digno."
        static let OPT4 = "A que se te comuniquen todas las decisiones que puedan afectar tus derechos."
        static let OPT5 = "A que la comunidad se entere de lo ocurrido para que puedan identificarte a ti y a tu familia como víctimas."
        static let ERROR = "Nunca olvides que tienes derecho a decidir voluntariamente si quieres ser confrontada con el agresor o agresores y a manifestar tu intención de conciliar. \n\n Recuerda que tienes el derecho a la reserva de tu intimidad, de tus datos personales, y los de tus familiares y personas allegadas. \n\n Aunque te equivoques sigues aprendiendo ¡Inténtalo de nuevo!"
        static let ERROR_INBOLD = "Aunque te equivoques sigues aprendiendo"
    }
    
    struct PAGE_16 {
        static let TITLE = VBG_COURSE.PAGE_13.SUBTITLE
        static let T1 = "¡Excelente!"
        static let T2 = "Ahora debo llamarte %@. ¡Buen trabajo!"
    }
    
    // Modulo 3
    struct PAGE_17 {
        static let TITLE = "Módulo 3"
        static let SUBTITLE = "¿Qué puedo hacer si creo ser víctima de violencia?"
        static let T1 = "Ahora que identificas las violencias contra las mujeres y conoces los derechos que contempla la ley para mujeres y niñas víctimas de violencia en Colombia, llegó el momento de explorar cuáles son las acciones y entidades disponibles para proteger tu integridad y poner fin a la violencia."
        static let T2 = "Si consideras que eres una mujer víctima de cualquier tipo de violencia, incluidas las cometidas en el conflicto armado, puedes tomar alguna o todas las siguientes opciones señaladas por la ley:"
    }
    
    struct PAGE_18 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let SUBTITLE = "Solicita información"
        static let T1 = "Tienes derecho a informarte y buscar orientación acerca de:"
        static let ITEM_1 = "Procedimientos legales que se originan de los hechos violentos"
        static let ITEM_2 = "Entidades estatales que pueden protegerte"
        static let ITEM_3 = "Servicios y medidas disponibles para atender las necesidades que hayan generado los hechos"
        static let AUDIO_1 = "Ten en cuenta que:"
    }
    
    struct PAGE_19 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_20 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let SUBTITLE = "Solicita atención en salud"
        static let T1 = "Tienes el derecho de acudir o ser transladada un centro de salud, hospital o clínica, para que te brinden la atención médica y psicológica"
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_21 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_22 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let SUBTITLE = "Accede a la justicia"
        static let T1 = "Tienes derecho a que los hechos sean investigados y que el agresor sea juzgado y castigado, así tu podrás exigir la reparación de los daños que has sufrido y la no repetición de los hechos."
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_23 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_24 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let SUBTITLE = "Solicita medidas de protección"
        static let T1 = "Tienes derecho a proteger tu integridad y la de tus hijos e hijas y poner fin a la violencia. Para ello, existen medidas específicas e inmediatas conocidas como “medidas de protección” que pueden ser otorgadas por las autoridades competentes."
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_25 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_26 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_27 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_28 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let SUBTITLE = "Solicita medidas de atención"
        static let T1 = "Tienes derecho, si es necesario, a acceder a servicios temporales de habitación, alimentación y/o transporte para ti y tus hijos e hijas. Estos servicios forman parte de tu derecho fundamental a la salud."
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_29 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
    }
    
    struct PAGE_30 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let T1 = "¡Felicitaciones! Has trabajado duro y ahora estás muy cerca de convertirte en Consejera Avanzada. Responde el siguiente cuestionario y consigue el título."
    }
    
    struct PAGE_31 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let T1 = "Responde a las siguientes preguntas seleccionando una o varias respuestas según lo consideres necesario."
        static let QUESTION = "1. Si requieres medidas de protección al ser víctima de hechos violentos en el contexto familiar, debes acudir a:"
        static let OPT1 = "Comisaría de Familia"
        static let OPT2 = "Juez Civil o Promiscuo Municipal"
        static let OPT3 = "Organizaciones de mujeres y redes comunitarias."
        static let ERROR = "Las organizaciones de mujeres y redes comunitarias pueden brindarte orientación si eres víctima de violencia y requieres información, pero no son las entidades encargadas de brindarte medidas de protección."
    }
    
    struct PAGE_32 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let QUESTION = "2. Si eres víctima de violencia sexual tienes derecho a:"
        static let OPT1 = "A que te practiquen exámenes para detectar enfermedades de transmisión sexual"
        static let OPT2 = "A que te lleven con el agresor para que puedas enfrentarle personalmente"
        static let OPT3 = "A que te suministren de manera gratuita anticoncepción de emergencia"
        static let OPT4 = "A que te realicen una prueba de embarazo"
        static let ERROR = "La Ley establece que la mujer víctima de violencia tiene derecho a decidir voluntariamente si puede ser confrontada con el agresor"
    }
    
    struct PAGE_33 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let QUESTION = "3. Si decides acceder a la justicia debes tener en cuenta:"
        static let OPT1 = "Contar con el dinero necesario para pagar una abogada."
        static let OPT2 = "Que la autoridad que te haya atendido te entregue la copia de la denuncia penal."
        static let OPT3 = "No ser sometida a pruebas repetitivas o que signifiquen una intromisión innecesaria a tu derecho a la intimidad."
        static let ERROR = "Recuerda, si lo necesitas, la Defensoría del Pueblo tiene la obligación de brindarte de manera gratuita servicios de orientación, asesoría y/o representación judicial."
    }
    
    struct PAGE_34 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let QUESTION = "4. Si solicitas atención en salud debes tener en cuenta:"
        static let OPT1 = "Siempre deben explicarte claramente los procedimientos que te realizarán y tú debes dar tu autorización de manera expresa."
        static let OPT2 = "Contar con una afiliación vigente al sistema de seguridad social en salud."
        static let OPT3 = "Deben entregarte una copia de la historia clínica dónde queden escritas todas las actuaciones y procedimientos realizados."
        static let OPT4 = "Si eres víctima de violencia sexual la atención médica debe ser prioritaria, inmediata, gratuita y debe ser tratada como una urgencia."
        static let ERROR = "Si no te encuentras afiliada al sistema de Seguridad Social en Salud (SGSSS), la IPS (centro de salud, hospital o clínica) debe informar a la alcaldía de tu municipio para que ésta realice el trámite de afiliación."
    }
    
    struct PAGE_35 {
        static let TITLE = VBG_COURSE.PAGE_17.SUBTITLE
        static let T1 = "¡Excelente!"
        static let T2 = "¡Mira que lejos estás del inicio! ¡Felicitaciones ya eres %@! ¡Ve por más!"
    }
    
    // Module 4
    struct PAGE_36 {
        static let TITLE = "Módulo 4"
        static let SUBTITLE = "¿Qué puedo hacer si creo ser víctima de violencia en el conflicto armado?"
        static let T1 = "Si consideras que eres una mujer víctima de cualquier tipo de violencia cometida en el conflicto armado, además de todas las medidas señaladas en el punto anterior, puedes tomar alguna o todas las siguientes opciones especiales dispuestas por la ley, teniendo siempre en cuenta tus intereses y situación particular.\n\n Recuerda que en casos de violencia cometidos por actores armados, las mujeres tienen derecho de acceder tanto a las medidas generales desarrolladas para las mujeres víctimas de violencia fuera del conflicto, como a medidas especiales aplicables a las víctimas del conflicto armado."
    }
    
    struct PAGE_37 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let SUBTITLE = "Accede a la justicia en el marco de la ley de justicia y paz (ley 975/05)"
        static let T1 = "Tienes el derecho de acceder al procedimiento especial de la Ley de Justicia y Paz (Ley 975/05), siempre que hayas sido víctima de delitos cometidos por un grupo armado ilegal (conocidos como Grupos Armados Organizados al Margen de la Ley, GAOML)."
    }
    
    struct PAGE_38 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let SUBTITLE = "Solicita medidas de protección especiales"
        static let T1 = "Si eres una lideresa, una defensora de derechos humanos o una mujer víctima del conflicto armado; amenazada y en riesgo, tienes derecho a proteger tu vida, integridad, libertad y seguridad."
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_39 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let SUBTITLE = "Puedes acceder a las medidas de asistencia y atención, de estabilización económica y reparación integral en el marco de la Ley de Víctimas (Ley 1448/11)."
        static let T1 = "En caso que seas una mujer víctima del conflicto armado tienes derecho a recibir las siguientes medidas:"
        static let AUDIO_1 = "Medidas de asistencia y atención"
        static let AUDIO_2 = "Medidas de estabilización económica"
        static let AUDIO_3 = "Medidas de reparación integral"
    }
    
    struct PAGE_40 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Ahora que conoces cuáles son las medidas de protección a las que tienes derecho y a qué entidades debes acudir para obtenerlas, ten presentes las siguientes recomendaciones:"
        static let AUDIO_1 = "Ten en cuenta:"
    }
    
    struct PAGE_41 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Para acceder a las medidas protección mencionadas, es necesario que declares los hechos de los que fuiste víctima y te inscribas en el Registro Único de Víctimas (RUV). Recuerda que este es un trámite gratuito y que no requiere de un representante. El camino para la inscripción en el RUV tiene los siguientes pasos:"
        static let T2 = "La puedes realizar ante el Ministerio Público que está conformado por: la Procuraduría General de la Nación, la Defensoría del Pueblo y Personerías municipales."
        static let T3 = "Recuerda que:"
        static let ITEM_1 = "Allí se diligencia el Formato Único de Declaración (FUD)."
        static let ITEM_2 = "En lo posible, debes presentar tu declaración por TODOS los hechos de los que has sido víctima."
        static let ITEM_3 = "No deben exigirte documentos que comprueben los hechos de los que fuiste víctima."
        static let ITEM_4 = "No deben negarse bajo ningún motivo a recibir tu declaración."
        static let ITEM_5 = "Ten en cuenta que con la sola declaración tienes la posibilidad de acceder a medidas de ayuda humanitaria inmediata por parte de la Alcaldía."
        static let ITEM_6 = "Una vez estés inscrita en el RUV, tienes derecho a recibir ayudas humanitarias de emergencia y transición por parte de la Unidad para las Víctimas."
    }
    
    struct PAGE_42 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Consiste en el envío del formato diligenciado y el resto de documentos a la Unidad de Víctimas para que esta revise si está completa."
        static let T2 = "Consiste en la revisión del formato y el resto de documentos por parte de la Unidad de Víctimas. Pueden ocurrir dos situaciones:"
        static let ITEM_1 = "Si el formato está completo, continúa al siguiente paso."
        static let ITEM_2 = "Si el formato está incompleto, es devuelto a la entidad que envió la declaración para que la complete."
    }
    
    struct PAGE_43 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Consiste en el estudio del formato y el resto de documentos por parte de la Unidad de Víctimas."
        static let T1_inBOLD = "estudio"
        static let T2 = "Consiste en la definición acerca de tu inclusión en el registro por parte de la Unidad de Víctimas. Pueden ocurrir dos situaciones:"
        static let T2_inBOLD = "definición acerca de tu inclusión"
        static let ITEM_1 = "Ser incluida. En este caso tienes acceso a las medias de asistencia y reparación integral."
        static let ITEM_1_inBOLD = "Ser incluida."
        static let ITEM_2 = "No ser incluida. En este caso puedes hacer uso de recursos para pedir la revisión de la decisión."
        static let ITEM_2_inBOLD = "No ser incluida."
    }
    
    struct PAGE_44 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let SUBTITLE = "¿Qué puedo hacer en caso que las entidades no cumplan sus funciones o no garanticen mis derechos?"
        static let T1 = "Si eres víctima de violencia de género y las entidades encargadas de orientarte, atenderte o protegerte no han cumplido con sus funciones según lo establece la ley, toma nota de las siguientes recomendaciones:"
    }
    
    struct PAGE_45 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Has llegado al final del camino, estás a un paso de obtener la recompensa por todo tu esfuerzo. Mira atentamente el siguiente video y pon a prueba tu mente respondiendo algunas preguntas."
    }
    
    struct PAGE_46 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
    }
    
    struct PAGE_47 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "Selecciona una o varias respuestas según lo consideres necesario"
        static let QUESTION = "1. Cuando la violencia proviene del esposo, compañero permanente, padre, madre, abuelos o nietos; se le llama violencia en la:"
        static let OPT1 = "Familia"
        static let OPT2 = "Conflicto armado"
        static let OPT3 = "Comunidad"
        static let OPT4 = "En el ámbito estatal"
        static let ERROR = "Recuerda que si la violencia proviene del esposo, el compañero permanente, los padres, abuelos o nietos se denomina violencia en la familia"
    }
    
    struct PAGE_48 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "2. Se manifiesta a través del uso de la fuerza, como golpes, ahogamientos, empujones:"
        static let OPT1 = "Violencia sexual"
        static let OPT2 = "Violencia psicológica"
        static let OPT3 = "Violencia económica"
        static let OPT4 = "Violencia física"
        static let ERROR = "Recuerda que la violencia física se manifiesta a través del uso de la fuerza, como golpes, ahogamientos, empujones."
    }
    
    struct PAGE_49 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "3. Escribe el número de la línea de orientación a las mujeres víctimas de violencia"
        static let ERROR = "Marca el número 155 para comunicarte con la línea de orientación a las mujeres víctimas de violencia, desde tu teléfono fijo o celular, de manera gratuita, durante las 24 horas del día, todos los días de la semana."
    }
    
    struct PAGE_50 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "4. Como mujer víctima de violencia, tienes derecho a:"
        static let OPT1 = "A una atención integral, oportuna, especializada y de calidad."
        static let OPT2 = "A pasar por el proceso de conciliación, en todos los conflictos el primer paso debe ser siempre la conciliación."
        static let OPT3 = "A un trato humano, respetuoso y digno."
        static let OPT4 = "A que se te comuniquen todas las decisiones que puedan afectar tus derechos."
        static let ERROR = "Nunca olvides que tienes derecho a una atención integral, oportuna, especializada y de calidad, a decidir voluntariamente si quieres ser confrontada con el agresor o agresores y a manifestar tu intención de no conciliar. También tienes el derecho a la reserva de tu intimidad, de tus datos personales, y los de tus familiares y personas allegadas."
    }
    
    struct PAGE_51 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "5. Si requieres medidas de protección al ser víctima de hechos violentos en el contexto familiar, debes acudir a:"
        static let OPT1 = "Comisaría de Familia"
        static let OPT2 = "Juez Civil o Promiscuo Municipal"
        static let OPT3 = "Organizaciones de mujeres y redes comunitarias."
        static let ERROR = "Recuerda acudir a la Comisaría de Familia, ante un Juez Civil o Promiscuo Municipal, cuando has sido víctima de hechos violentos en el contexto familiar"
    }
    
    struct PAGE_52 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "6. Si decides acceder a la justicia debes tener en cuenta:"
        static let OPT1 = "Contar con el dinero necesario para pagar una abogada."
        static let OPT2 = "Que la autoridad que te haya atendido te entregue la copia de la denuncia penal."
        static let OPT3 = "No ser sometida a pruebas repetitivas o que signifiquen una intromisión innecesaria a tu derecho a la intimidad."
        static let ERROR = "Recuerda, si lo necesitas, la Defensoría del Pueblo tiene la obligación de brindarte de manera gratuita servicios de orientación, asesoría y/o representación judicial."
    }
    
    struct PAGE_53 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "7. Si soy víctima de desplazamiento forzado tengo derecho a:"
        static let OPT1 = "Atención médica y psicológica de emergencia"
        static let OPT2 = "Transporte y alojamiento transitorio"
        static let OPT3 = "Apoyo a procesos de retorno"
        static let OPT4 = "Descuentos especiales en planes de vivienda"
        static let ERROR = "Recuerda que si eres víctima de desplazamiento forzado tienes derecho a atención médica y psicológica de emergencia, apoyo a procesos de retorno y a transporte y alojamiento transitorio"
    }
    
    struct PAGE_54 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let QUESTION = "8. ¿Qué instancias realizan control sobre las entidades estatales?"
        static let OPT1 = "Procuraduría General de la Nación"
        static let OPT2 = "Defensoría del Pueblo"
        static let OPT3 = "Personerías"
        static let OPT4 = "Comisarías de Familia"
        static let ERROR = "Ten presente que si una entidad estatal no cumple con sus funciones o no protege tus derechos, puedes denunciarlo ante Ministerio Público que está conformado por la Procuraduría General de la Nación, la Defensoría del Pueblo y Personerías."
    }
    
    struct PAGE_55 {
        static let TITLE = VBG_COURSE.PAGE_36.SUBTITLE
        static let T1 = "¡Buen trabajo!"
        static let T2 = "Te has esforzado al máximo y has logrado cumplir la meta. Finalmente has alcanzado el último nivel ¡Felicitaciones %@!"
    }
}

/**
 Construye un palabra de acuerdo, a los campos del crucigrama y la valida con su
 respectiva respuesta
 
 - Parameter word: Arreglo de campos de texto, con los cuales se armara la palabra que debe ser verificada
 - Parameter option: id de la respuesta.
 - Returns: **True** Si la palabra armada y la respuesta correspondiente al id recibido coinciden, **False** en caso contrario
*/
func validateCrossword(word: Array<UITextField>, correctAnswer: String) -> Bool {
    var resp = nullString
    
    // Concatena el contenido de cada linea(Clue) del crucigrama para formar una palabra y poder compararla con las respuestas
    for letter in word {
        resp = resp + letter.text!
    }
    printDebugMessage(tag: "Validando: \(resp) =? \(correctAnswer)")
    
    return resp.uppercased() == correctAnswer.uppercased()
}


