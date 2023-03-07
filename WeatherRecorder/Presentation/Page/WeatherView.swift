//
//  WeatherView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel: SeoulWeatherViewModel = SeoulWeatherViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.weatherInfo?.name ?? "-")")
                    .font(Font.system(size: 50))
                    .fontWeight(Font.Weight.medium)
                    .foregroundColor(.white)
                
                Text("\(String(format: "%.0f", viewModel.weatherInfo?.main?.temp ?? 0.0))º")
                    .font(Font.system(size: 50))
                    .fontWeight(Font.Weight.medium)
                    .foregroundColor(.white)
                
                Text("\((viewModel.weatherInfo?.weather?[0].description) ?? "-")")
                    .font(Font.system(size: 25))
                    .fontWeight(Font.Weight.light)
                    .foregroundColor(.white)
                
                
                HStack {
                    Text("최고 : \(String(format: "%.0f", viewModel.weatherInfo?.main?.temp_max ?? 0.0))º")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                        .foregroundColor(.white)
                    
                    
                    Text("최저 : \(String(format: "%.0f", viewModel.weatherInfo?.main?.temp_min ?? 0.0))º")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("일출 : \(String(viewModel.weatherInfo?.sys?.convertSunriseUTCToLocaleString() ?? "-"))")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                        .foregroundColor(.white)
                    
                    Text("일몰 : \(String(viewModel.weatherInfo?.sys?.convertSunsetUTCToLocaleString() ?? "-"))")
                        .font(Font.system(size: 25))
                        .fontWeight(Font.Weight.light)
                        .foregroundColor(.white)
                }
                
                
                Text("오늘 기분 상태 : \(viewModel.getTodayRecordedEmotion() ?? "--")")
                    .foregroundColor(.white)
                HStack(spacing: 10) {
                    
                    ForEach(viewModel.moodStateList, id: \.self) { str in
                        Button {
                            viewModel.addEmotion(emotion: str)
                        } label: {
                            Text(str)
                                .modifier(SmallButtonModifier(disabled: viewModel.alreadyRecordEmotion))
                        }
                        .disabled(viewModel.alreadyRecordEmotion)
                    }
                }
                
                HStack{
                    SectorCard {
                        Text("습도")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.0f", viewModel.weatherInfo?.main?.humidity ?? 0))%")
                            .foregroundColor(.white)
                    }
                    
                    SectorCard {
                        Text("체감온도")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.0fº", viewModel.weatherInfo?.main?.feels_like ?? 0))")
                            .foregroundColor(.white)
                    }
                }
                
                
                HStack {
                    SectorCard {
                        Text("가시거리")
                            .foregroundColor(.white)
                        Text("\(viewModel.weatherInfo?.visibility ?? 0)")
                            .foregroundColor(.white)
                    }
                    
                    SectorCard {
                        Text("바람")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.2f", viewModel.weatherInfo?.wind?.speed ?? 0)) m/s")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.0f", viewModel.weatherInfo?.wind?.deg ?? 0)) deg")
                            .foregroundColor(.white)
                    }
                }
                
                HStack {
                    SectorCard {
                        Text("기압")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.0f",  viewModel.weatherInfo?.main?.pressure ?? 0))hPa")
                            .foregroundColor(.white)
                    }
                    SectorCard {
                        Text("강수량")
                            .foregroundColor(.white)
                        Text("\(String(format: "%.2f", viewModel.weatherInfo?.rain?.lastHour ?? 0)) mm")
                            .foregroundColor(.white)
                        Text("지난 1시간")
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .task {
            await viewModel.setSeoulWeatherInfo()
            viewModel.setBackgroundImage()
            viewModel.setAlreadyRecordEmotion()
        }
        .background(
            Image(viewModel.backgroundImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
