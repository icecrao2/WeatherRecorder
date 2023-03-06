//
//  AddEmotionUseCase.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation


class AddEmotionUseCase {
    
    private let repo: AddEmotionRepositoryProtocol
    
    init(_ repo: AddEmotionRepositoryProtocol) {
        self.repo = repo
    }
    
    func addEmotion(model: WeatherEmotionModel) {
        repo.excute(model: model)
    }
    
}
