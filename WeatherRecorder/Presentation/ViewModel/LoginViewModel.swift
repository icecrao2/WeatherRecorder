//
//  LoginViewModel.swift
//  WeatherRecorder
//
//  Created by sw on 2023/02/04.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    
    
    @Published var inputedName: String = ""
    @Published var inputedPassword: String = ""
    
    
    
    
    @MainActor
    func login() {
        
        print(inputedName)
        print(inputedPassword)
        
    }
    
    
    
    private func clearInputedText() {
        inputedName = ""
        inputedName = ""
    }
    
}
