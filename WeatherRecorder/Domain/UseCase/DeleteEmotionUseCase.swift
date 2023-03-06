//
//  DeleteEmotionUseCase.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/06.
//

import Foundation


class DeleteEmotionUseCase {
    
    private let repo: DeleteEmotionRepositoryProtocol
    
    init(_ repo: DeleteEmotionRepositoryProtocol) {
        self.repo = repo
    }
    
    func deleteEmotion(at offsets: IndexSet) {
        repo.excute(at: offsets)
    }
    
}
