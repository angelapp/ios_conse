//
//  Audios_Name.swift
//  conse
//
//  Created by Felipe Zamudio on 28/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import Foundation

// MARK: - Títulos de los audios
/// Nombre de los audios para el avatar Fenenino
enum AUDIO_FEMALE: String {
    
    // Nombre de los audios del curso "Violencia Basada en Género"
    case VBG_female_01, VBG_female_02, VBG_female_03, VBG_female_04, VBG_female_05, VBG_female_06, VBG_female_07, VBG_female_08, VBG_female_09, VBG_female_10
    case VBG_female_11_1, VBG_female_12, VBG_female_13, VBG_female_14, VBG_female_15, VBG_female_16, VBG_female_17, VBG_female_18, VBG_female_19, VBG_female_20
    case VBG_female_21
    
    // Nombre de los audios del curso "Protección líderes comunitarios"
    case Leader_female_01, Leader_female_02, Leader_female_03, Leader_female_04, Leader_female_05, Leader_female_06, Leader_female_07, Leader_female_08, Leader_female_09, Leader_female_10
    case Leader_female_11, Leader_female_12, Leader_female_13, Leader_female_14, Leader_female_15, Leader_female_16, Leader_female_17, Leader_female_18, Leader_female_19, Leader_female_20_1
    case Leader_female_21, Leader_female_22, Leader_female_23, Leader_female_24, Leader_female_25, Leader_female_26, Leader_female_27, Leader_female_28, Leader_female_29
}

/// Nombre de los audios para el avatar Masculino
enum AUDIO_MALE: String {
    
    // Nombre de los audios del curso "Violencia Basada en Género"
    case VBG_male_01, VBG_male_02, VBG_male_03, VBG_male_04, VBG_male_05, VBG_male_06, VBG_male_07, VBG_male_08, VBG_male_09, VBG_male_10
    case VBG_male_11_1, VBG_male_12, VBG_male_13, VBG_male_14, VBG_male_15, VBG_male_16, VBG_male_17, VBG_male_18, VBG_male_19, VBG_male_20
    case VBG_male_21
    
    // Nombre de los audios del curso "Protección líderes comunitarios"
    case Leader_male_01, Leader_male_02, Leader_male_03, Leader_male_04, Leader_male_05, Leader_male_06, Leader_male_07, Leader_male_08, Leader_male_09, Leader_male_10
    case Leader_male_11, Leader_male_12, Leader_male_13, Leader_male_14, Leader_male_15, Leader_male_16, Leader_male_17, Leader_male_18, Leader_male_19, Leader_male_20_1
    case Leader_male_21, Leader_male_22, Leader_male_23, Leader_male_24, Leader_male_25, Leader_male_26, Leader_male_27, Leader_male_28, Leader_male_29
}

// MARK: - Funciones para obtener el nombre del audio de acuerdo al curso
/**
 Obtiene el nombre del audio a reproducir de acuerdo al género del Avatar
 Solo para los audios del curso "Violencia Basada en Género"
 
 - Parameter forAudio: ID del audio
 - Returns: Nombre con el que esta guardado el audio.
 */
func get_VBGAudioName(forAudio id: VBG_AUDIO_ID) -> String {
    let avatar_gender = AplicationRuntime.sharedManager.getAvatarGenderID()
    
    switch id {
        
    case .AUD_01:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_01.rawValue : AUDIO_FEMALE.VBG_female_01.rawValue
        
    case .AUD_02:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_02.rawValue : AUDIO_FEMALE.VBG_female_02.rawValue
        
    case .AUD_03:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_03.rawValue : AUDIO_FEMALE.VBG_female_03.rawValue
        
    case .AUD_04:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_04.rawValue : AUDIO_FEMALE.VBG_female_04.rawValue
        
    case .AUD_05:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_05.rawValue : AUDIO_FEMALE.VBG_female_05.rawValue
        
    case .AUD_06:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_06.rawValue : AUDIO_FEMALE.VBG_female_06.rawValue
        
    case .AUD_07:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_07.rawValue : AUDIO_FEMALE.VBG_female_07.rawValue
        
    case .AUD_08:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_08.rawValue : AUDIO_FEMALE.VBG_female_08.rawValue
        
    case .AUD_09:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_09.rawValue : AUDIO_FEMALE.VBG_female_09.rawValue
        
    case .AUD_10:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_10.rawValue : AUDIO_FEMALE.VBG_female_10.rawValue
        
    case .AUD_11:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_11_1.rawValue : AUDIO_FEMALE.VBG_female_11_1.rawValue
        
    case .AUD_12:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_12.rawValue : AUDIO_FEMALE.VBG_female_12.rawValue
        
    case .AUD_13:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_13.rawValue : AUDIO_FEMALE.VBG_female_13.rawValue
        
    case .AUD_14:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_14.rawValue : AUDIO_FEMALE.VBG_female_14.rawValue
        
    case .AUD_15:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_15.rawValue : AUDIO_FEMALE.VBG_female_15.rawValue
        
    case .AUD_16:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_16.rawValue : AUDIO_FEMALE.VBG_female_16.rawValue
        
    case .AUD_17:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_17.rawValue : AUDIO_FEMALE.VBG_female_17.rawValue
        
    case .AUD_18:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_18.rawValue : AUDIO_FEMALE.VBG_female_18.rawValue
        
    case .AUD_19:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_19.rawValue : AUDIO_FEMALE.VBG_female_19.rawValue
        
    case .AUD_20:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_20.rawValue : AUDIO_FEMALE.VBG_female_20.rawValue
        
    default:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.VBG_male_21.rawValue : AUDIO_FEMALE.VBG_female_21.rawValue
    }
}

/**
 Obtiene el nombre del audio a reproducir de acuerdo al género del Avatar
 Solo para los audios del curso "Líderes comunitarios"
 
 - Parameter forAudio: ID del audio
 - Returns: Nombre con el que esta guardado el audio.
 */
func get_LeadersAudioName(forAudio id: Int) -> String {
    let avatar_gender = AplicationRuntime.sharedManager.getAvatarGenderID()
    
    switch id {
        
    case LEADERS_AUDIO_ID.AUD_01.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_01.rawValue : AUDIO_FEMALE.Leader_female_01.rawValue
        
    case LEADERS_AUDIO_ID.AUD_02.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_02.rawValue : AUDIO_FEMALE.Leader_female_02.rawValue
        
    case LEADERS_AUDIO_ID.AUD_03.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_03.rawValue : AUDIO_FEMALE.Leader_female_03.rawValue
        
    case LEADERS_AUDIO_ID.AUD_04.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_04.rawValue : AUDIO_FEMALE.Leader_female_04.rawValue
        
    case LEADERS_AUDIO_ID.AUD_05.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_05.rawValue : AUDIO_FEMALE.Leader_female_05.rawValue
        
    case LEADERS_AUDIO_ID.AUD_06.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_06.rawValue : AUDIO_FEMALE.Leader_female_06.rawValue
        
    case LEADERS_AUDIO_ID.AUD_07.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_07.rawValue : AUDIO_FEMALE.Leader_female_07.rawValue
        
    case LEADERS_AUDIO_ID.AUD_08.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_08.rawValue : AUDIO_FEMALE.Leader_female_08.rawValue
        
    case LEADERS_AUDIO_ID.AUD_09.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_09.rawValue : AUDIO_FEMALE.Leader_female_09.rawValue
        
    case LEADERS_AUDIO_ID.AUD_10.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_10.rawValue : AUDIO_FEMALE.Leader_female_10.rawValue
        
    case LEADERS_AUDIO_ID.AUD_11.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_11.rawValue : AUDIO_FEMALE.Leader_female_11.rawValue
        
    case LEADERS_AUDIO_ID.AUD_12.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_12.rawValue : AUDIO_FEMALE.Leader_female_12.rawValue
        
    case LEADERS_AUDIO_ID.AUD_13.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_13.rawValue : AUDIO_FEMALE.Leader_female_13.rawValue
        
    case LEADERS_AUDIO_ID.AUD_14.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_14.rawValue : AUDIO_FEMALE.Leader_female_14.rawValue
        
    case LEADERS_AUDIO_ID.AUD_15.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_15.rawValue : AUDIO_FEMALE.Leader_female_15.rawValue
        
    case LEADERS_AUDIO_ID.AUD_16.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_16.rawValue : AUDIO_FEMALE.Leader_female_16.rawValue
        
    case LEADERS_AUDIO_ID.AUD_17.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_17.rawValue : AUDIO_FEMALE.Leader_female_17.rawValue
        
    case LEADERS_AUDIO_ID.AUD_18.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_18.rawValue : AUDIO_FEMALE.Leader_female_18.rawValue
        
    case LEADERS_AUDIO_ID.AUD_19.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_19.rawValue : AUDIO_FEMALE.Leader_female_19.rawValue
        
    case LEADERS_AUDIO_ID.AUD_20.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_20_1.rawValue : AUDIO_FEMALE.Leader_female_20_1.rawValue
        
    case LEADERS_AUDIO_ID.AUD_21.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_21.rawValue : AUDIO_FEMALE.Leader_female_21.rawValue
        
    case LEADERS_AUDIO_ID.AUD_22.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_22.rawValue : AUDIO_FEMALE.Leader_female_22.rawValue
        
    case LEADERS_AUDIO_ID.AUD_23.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_23.rawValue : AUDIO_FEMALE.Leader_female_23.rawValue
        
    case LEADERS_AUDIO_ID.AUD_24.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_24.rawValue : AUDIO_FEMALE.Leader_female_24.rawValue
        
    case LEADERS_AUDIO_ID.AUD_25.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_25.rawValue : AUDIO_FEMALE.Leader_female_25.rawValue
        
    case LEADERS_AUDIO_ID.AUD_26.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_26.rawValue : AUDIO_FEMALE.Leader_female_26.rawValue
        
    case LEADERS_AUDIO_ID.AUD_27.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_27.rawValue : AUDIO_FEMALE.Leader_female_27.rawValue
        
    case LEADERS_AUDIO_ID.AUD_28.rawValue:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_28.rawValue : AUDIO_FEMALE.Leader_female_28.rawValue
        
    default:
        return avatar_gender == AvatarGenderIDs.male.rawValue ? AUDIO_MALE.Leader_male_29.rawValue : AUDIO_FEMALE.Leader_female_29.rawValue
    }
}
