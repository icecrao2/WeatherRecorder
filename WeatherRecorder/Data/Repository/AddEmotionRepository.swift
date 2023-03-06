//
//  AddEmotionRepository.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation
import SwiftUI

class AddEmotionRepository : AddEmotionRepositoryProtocol{

    @FetchRequest(
        entity: Emotion.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Emotion.date, ascending: true)
          ],
          predicate: NSPredicate(format: "genre contains 'Action'")
    ) var emotions: FetchedResults<Emotion>
    
    
    func excute(model: WeatherEmotionModel) {
        let newEmotion = Emotion(context: PersistenceController.shared.container.viewContext)
        
        newEmotion.date = Date()
        newEmotion.cloud = Int64(model.cloud)
        newEmotion.emotion = model.emotion
        newEmotion.feel_temp = Int64(model.feelTemp)
        newEmotion.rainy = Int64(model.rainy)
        newEmotion.snow = Int64(model.snow)
        newEmotion.wind = Int64(model.wind)
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try  PersistenceController.shared.container.viewContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}
