//
//  ReadEmotionRepository.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation
import CoreData
import SwiftUI

class ReadEmotionRepository: ReadEmotionRepositoryProtocol {
    
    
    func excute() -> [WeatherEmotionModel] {

        do {
            let request: NSFetchRequest<Emotion> = Emotion.fetchRequest()
            let emotions = try PersistenceController.shared.container.viewContext.fetch(request)
            return emotions.map { emotion in
                WeatherEmotionModel(
                    cloud: Int(emotion.wind),
                    emotion: emotion.emotion ?? "--",
                    feelTemp: Int(emotion.feel_temp),
                    rainy: Int(emotion.rainy),
                    snow: Int(emotion.snow),
                    wind: Int(emotion.wind),
                    date: emotion.date ?? Date()
                )
            }
        } catch {
            print("exception")
        }
        return []
    }
    
}
