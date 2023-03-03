//
//  GetSeoulWeatherInfoUseCase.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation



class GetSeoulWeatherInfoUseCase {

    private let repo: GetSeoulWeatherInfoRepositoryProtocol
    
    init(_ repo: GetSeoulWeatherInfoRepositoryProtocol) {
        self.repo = repo
    }
    
    func excute() async -> WeatherResponseEntity?{
        return await repo.excute()
    }
}
