//
//  WeatherView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import SwiftUI

struct WeatherView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @StateObject private var viewModel: SeoulWeatherViewModel = SeoulWeatherViewModel()
    
    
    
    var body: some View {
        VStack {
            VStack {
                Text("\(viewModel.weatherInfo?.name ?? "-")")
                    .font(Font.system(size: 50))
                    .fontWeight(Font.Weight.medium)
                
                Text("\(String(format: "%.0f", viewModel.weatherInfo?.main?.temp ?? 0.0))º")
                    .font(Font.system(size: 50))
                    .fontWeight(Font.Weight.medium)
                
                Text("\((viewModel.weatherInfo?.weather?[0].description) ?? "-")")
                    .font(Font.system(size: 25))
                    .fontWeight(Font.Weight.light)
                
                
                HStack {
                    Text("최고 : \(String(format: "%.0f", viewModel.weatherInfo?.main?.temp_max ?? 0.0))º")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                    
                    
                    Text("최저 : \(String(format: "%.0f", viewModel.weatherInfo?.main?.temp_min ?? 0.0))º")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                }
                
                HStack {
                    Text("일출 : \(String(viewModel.weatherInfo?.sys?.convertSunriseUTCToLocaleString() ?? "-"))")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                    
                    Text("일몰 : \(String(viewModel.weatherInfo?.sys?.convertSunsetUTCToLocaleString() ?? "-"))")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                }
                
                
                Text("오늘 기분 상태")
                HStack(spacing: 10) {
                    
                    ForEach(viewModel.moodStateList, id: \.self) { str in
                        Button {
                            print(str)
                        } label: {
                            Text(str)
                                .modifier(SmallButtonModifier())
                        }
                    }
                    
                }
                
                HStack{
                    SectorCard {
                        Text("습도")
                        Text("\(String(format: "%.0f", viewModel.weatherInfo?.main?.humidity ?? 0))")
                    }
                    
                    SectorCard {
                        Text("체감온도")
                        Text("\(String(format: "%.0fº", viewModel.weatherInfo?.main?.feels_like ?? 0))")
                    }
                }
                
                
                HStack {
                    SectorCard {
                        Text("가시거리")
                        Text("\(viewModel.weatherInfo?.visibility ?? 0)")
                    }
                    
                    SectorCard {
                        Text("바람")
                        Text("\(String(format: "%.2f", viewModel.weatherInfo?.wind?.speed ?? 0)) m/s")
                        Text("\(String(format: "%.0f", viewModel.weatherInfo?.wind?.deg ?? 0)) deg")
                    }
                }
                
                HStack {
                    SectorCard {
                        Text("기압")
                        Text("\(String(format: "%.0f",  viewModel.weatherInfo?.main?.pressure ?? 0))")
                    }
                    SectorCard {
                        Text("강수량")
                        Text("\(String(format: "%.2f", viewModel.weatherInfo?.rain?.lastHour ?? 0)) mm")
                        Text("지난 1시간")
                    }
                }
            }
            .padding(.horizontal)
        }
        .task {
            await viewModel.setSeoulWeatherInfo()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
