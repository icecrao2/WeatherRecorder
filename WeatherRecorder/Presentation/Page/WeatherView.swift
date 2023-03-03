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
            
            Text("\(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.main?.temp ?? 0.0))")
            
            Text("\((seoulWeatherViewModel.weatherInfo?.weather?[0].description) ?? "-")")
            
            HStack {
                Text("최고 : \(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.main?.temp_max ?? 0.0))")
                
                
                Text("최저 : \(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.main?.temp_min ?? 0.0))")
            }
            
            HStack {
                Text("일출 : \(String(seoulWeatherViewModel.weatherInfo?.sys?.convertSunriseUTCToLocaleString() ?? "-"))")
                
                Text("일몰 : \(String(seoulWeatherViewModel.weatherInfo?.sys?.convertSunsetUTCToLocaleString() ?? "-"))")
            }
            
            HStack {
                VStack {
                    Text("습도")
                    Text("\(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.main?.humidity ?? 0))")
                }
                VStack {
                    Text("체감온도")
                    Text("\(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.main?.feels_like ?? 0))")
                }
            }
            
            HStack {
                VStack {
                    Text("가시거리")
                    Text("\(seoulWeatherViewModel.weatherInfo?.visibility ?? 0)")
                }
                VStack {
                    Text("바람")
                    Text("\(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.wind?.speed ?? 0)) m/s")
                    Text("\(String(format: "%.0f", seoulWeatherViewModel.weatherInfo?.wind?.deg ?? 0)) deg")
                }
            }
            
            HStack {
                VStack {
                    Text("기압")
                    Text("\(String(format: "%.0f",  seoulWeatherViewModel.weatherInfo?.main?.pressure ?? 0))")
                }
                VStack {
                    Text("1시간 강수량")
                    Text("\(String(format: "%.2f", seoulWeatherViewModel.weatherInfo?.rain?.lastHour ?? 0)) mm")
                }
            }
            
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
