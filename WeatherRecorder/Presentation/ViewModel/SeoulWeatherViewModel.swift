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
    private let addEmotionUseCase: AddEmotionUseCase = AddEmotionUseCase(AddEmotionRepository())
    private let deleteEmotionUseCase: DeleteEmotionUseCase = DeleteEmotionUseCase(DeleteEmotionRepository())
    private let readEmotionUseCase: ReadEmotionUseCase = ReadEmotionUseCase(ReadEmotionRepository())
    
    
    let moodStateList: [String] = ["매우좋음", "좋음", "보통", "나쁨", "매우나쁨"]
    private let backgroundImageList: Dictionary<String, String> = DesignConst.backgroundImages
    
    @Published var weatherInfo: WeatherResponseEntity?
    @Published var backgroundImage: String = ""
    @Published var alreadyRecordEmotion: Bool = false
    
    
    func addEmotion(emotion: String) {
        addEmotionUseCase.addEmotion(model: weatherInfo!.translateToModel(emotion: emotion))
    }
    
    func deleteEmotion(at index: IndexSet) {
        deleteEmotionUseCase.deleteEmotion(at: index)
    }
    
    func getEmotion() -> [WeatherEmotionModel]{
        return readEmotionUseCase.read()
    }
    
    func setAlreadyRecordEmotion() {
        alreadyRecordEmotion = confirmAlreadyExistDateEmotion()
    }
    
    func getTodayRecordedEmotion() -> String? {
        
        guard let index: Int = (getEmotion().firstIndex {
            return getDateString(date: $0.date) == getTodayDateString()
        } )else { return  nil }
        
        return getEmotion()[index].emotion
    }
    
    private func confirmAlreadyExistDateEmotion() -> Bool {

        return (getEmotion().firstIndex {
            return getDateString(date: $0.date) == getTodayDateString()
        } != nil)
    }
    
    private func getTodayDateString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    private func getDateString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    @MainActor
    func setSeoulWeatherInfo() async {
        weatherInfo = await getSeoulWeatherInfoUseCase.excute()
    }
    
    func setBackgroundImage() {
        
        if weatherInfo?.rain?.lastHour != nil && weatherInfo!.rain!.lastHour! > 0 {
            backgroundImage = backgroundImageList["Rainy"] ?? ""
        } else {
            backgroundImage = backgroundImageList["Clear"] ?? ""
        }
    }
    
}
