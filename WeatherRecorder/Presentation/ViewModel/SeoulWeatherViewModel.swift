//
//  WeatherViewModel.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation
import SwiftUI


class SeoulWeatherViewModel: ObservableObject {

    @Environment(\.managedObjectContext) var managedObjectContext
    
    private let getSeoulWeatherInfoUseCase: GetSeoulWeatherInfoUseCase = GetSeoulWeatherInfoUseCase(GetSeoulWeatherInfoRepository())
    
    let moodStateList: [String] = ["매우좋음", "좋음", "보통", "나쁨", "매우나쁨"]

    
    @Published var weatherInfo: WeatherResponseEntity?
    
    @FetchRequest(
        entity: Emotion.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Emotion.date, ascending: true)
          ],
          predicate: NSPredicate(format: "genre contains 'Action'")
    ) var emotions: FetchedResults<Emotion>
    
    
    func addEmotions(cloud: Int, emotion: String, feelTemp: Int, rainy: Int, snow: Int, wind: Int, date: Date) {
        let newEmotion = Emotion(context: managedObjectContext)
        
        newEmotion.date = Date()
        newEmotion.cloud = Int64(cloud)
        newEmotion.emotion = emotion
        newEmotion.feel_temp = Int64(feelTemp)
        newEmotion.rainy = Int64(rainy)
        newEmotion.snow = Int64(snow)
        newEmotion.wind = Int64(wind)
        
        saveContext()
    }
    
    func deleteEmotions(at offsets: IndexSet) {
        offsets.forEach { index in
            let emotion = self.emotions[index]
            self.managedObjectContext.delete(emotion)
         }
         saveContext()
   }
    
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    
    @MainActor
    func setSeoulWeatherInfo() async {
        
        weatherInfo = await getSeoulWeatherInfoUseCase.excute()
    }
    
}
