//
//  DesignConst.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/04.
//

import Foundation
import SwiftUI

struct DesignConst {
    
    
    struct Colors {
        static let lightBlueColor: Color = Color(hex: "#5DBCCE")
        static let blueColor: Color = Color(hex: "#0180BE")
        static let lightRedColor: Color = .red.opacity(0.5)
        static let redColor: Color = .red
        static let grayColor: Color = Color(hex: "#D8D8D8")
        static let blackColor: Color = Color(hex: "#212729")
    }
    
    struct SectorCard {
        static let cardHeight: CGFloat = 40
        static let cardRadius: CGFloat = 10
        static let cardStrokeColor: Color = Color(hex: "#DFE6EE")
        static let cardBackgroundColor: Color = .clear
    }
    
    struct Button {
        static let buttonStrokeColor: Color = .gray.opacity(0.5)
        
        struct Height {
            static let smallButtonHeight: CGFloat = 30
        }
    }
}
