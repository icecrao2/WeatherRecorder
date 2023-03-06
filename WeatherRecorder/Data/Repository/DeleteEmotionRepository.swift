//
//  DeleteEmotionRepository.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation
import SwiftUI


class DeleteEmotionRepository: DeleteEmotionRepositoryProtocol {

    @FetchRequest(
        entity: Emotion.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Emotion.date, ascending: true)
          ],
          predicate: NSPredicate(format: "genre contains 'Action'")
    ) var emotions: FetchedResults<Emotion>
 
    
    func excute(at offsets: IndexSet) {
        offsets.forEach { index in
            let emotion = self.emotions[index]
            PersistenceController.shared.container.viewContext.delete(emotion)
        }
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
