//
//  Enum.swift
//  22_BMI
//
//  Created by Dmitriy Eni on 03.05.2022.
//

import Foundation

enum Gender: String, CaseIterable {
    case male   = "Мужской"
    case female = "Женский"
    
    var indexValue: Double {
        switch self {
        case .male:
            return 5
        case .female:
            return -161
        }
    }
}

enum Activity: String, CaseIterable {
    case minimal = "Минимальная: сидячая работа, отсутствие спорта"
    case easy    = "Легкая: легкие физические упражнения около 3 раз за неделю, ежедневная утренняя зарядка, пешие прогулки"
    case medium  = "Средняя: спорт до 5 раз за неделю"
    case high    = "Высокая: активный образ жизни вкупе с ежедневными интенсивными тренировками"
    case extreme = "Экстремальная: максимальная активность - спортивный образ жизни, тяжелый физический труд, длительные тяжелые тренировки каждый день"
    
    var coefficient: Double {
        switch self {
        case .minimal:
            return 1.2
        case .easy:
            return 1.35
        case .medium:
            return 1.55
        case .high:
            return 1.75
        case .extreme:
            return 1.95
        }
    }
}
