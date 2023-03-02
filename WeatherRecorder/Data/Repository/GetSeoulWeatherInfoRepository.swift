//
//  GetWeatherInfoRepository.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation


class GetSeoulWeatherInfoRepository: GetSeoulWeatherInfoRepositoryProtocol {

    private let baseURL: String = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey: String = "657b39958d5fb75412f87bc2e8e3848b"
    
    func excute() async -> WeatherResponseEntity? {
        let url: String = "\(baseURL)?q=Seoul&appid=\(apiKey)"
        
        guard let response: WeatherResponseEntity = await APIRequest<WeatherResponseEntity>.request(url, "GET") else {
            print("unknown error")
            return nil
        }
        
        return response
    }
    
    
}
