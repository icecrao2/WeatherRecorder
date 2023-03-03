//
//  WeatherViewModel.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation
import SwiftUI


class SeoulWeatherViewModel: ObservableObject {

    
    private let getSeoulWeatherInfoUseCase: GetSeoulWeatherInfoUseCase = GetSeoulWeatherInfoUseCase(GetSeoulWeatherInfoRepository())
    
    let moodStateList: [String] = ["매우좋음", "좋음", "보통", "나쁨", "매우나쁨"]

    
    @Published var weatherInfo: WeatherResponseEntity?
    
    
    
    
    
    
    @MainActor
    func setSeoulWeatherInfo() async {
        
        weatherInfo = await getSeoulWeatherInfoUseCase.excute()
    }
    
}
