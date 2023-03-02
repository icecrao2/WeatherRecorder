//
//  GetSeoulWeatherInfoRepositoryProtocol.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation

protocol GetSeoulWeatherInfoRepositoryProtocol {
    func excute() async -> WeatherResponseEntity?
}
