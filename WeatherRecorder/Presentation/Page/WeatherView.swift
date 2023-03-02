//
//  WeatherView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var seoulWeatherViewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("\(seoulWeatherViewModel.weatherInfo?.name ?? "-")")
        }
        .task {
            await seoulWeatherViewModel.setSeoulWeatherInfo()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
