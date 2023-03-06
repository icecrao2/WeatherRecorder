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
    
    let moodStateList: [String] = ["매우좋음", "좋음", "보통", "나쁨", "매우나쁨"]

    @Published var weatherInfo: WeatherResponseEntity?
    
    func addEmotion(emotion: String) {
        addEmotionUseCase.addEmotion(model: weatherInfo!.translateToModel(emotion: emotion))
    }
    
    func deleteEmotion(at index: IndexSet) {
        deleteEmotionUseCase.deleteEmotion(at: index)
    }
    
    
    @MainActor
    func setSeoulWeatherInfo() async {
        
        weatherInfo = await getSeoulWeatherInfoUseCase.excute()
    }
    
}
