//
//  ReadEmotionUseCase.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation

class ReadEmotionUseCase {
    
    private let repo: ReadEmotionRepositoryProtocol
    
    init(_ repo: ReadEmotionRepositoryProtocol) {
        self.repo = repo
    }
    
    func read() -> [WeatherEmotionModel] {
        return repo.excute()
    }
}
