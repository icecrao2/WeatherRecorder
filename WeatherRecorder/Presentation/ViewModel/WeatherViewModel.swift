//
//  WeatherViewModel.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation
import SwiftUI


class WeatherViewModel: ObservableObject {

    
    private let getSeoulWeatherInfoUseCase: GetSeoulWeatherInfoUseCase = GetSeoulWeatherInfoUseCase(GetSeoulWeatherInfoRepository())
    
    @Published var weatherInfo: WeatherResponseEntity?
    
    
    @MainActor
    func setSeoulWeatherInfo() async {
        
        weatherInfo = await getSeoulWeatherInfoUseCase.excute()
    }
    
}
