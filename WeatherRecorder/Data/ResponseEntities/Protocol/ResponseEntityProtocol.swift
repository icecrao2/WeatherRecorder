//
//  ResponseEntityProtocol.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation


protocol ResponseEntityProtocol: Codable {
    
    var code: Int? {get set}
    var message: String? {get set}
}
