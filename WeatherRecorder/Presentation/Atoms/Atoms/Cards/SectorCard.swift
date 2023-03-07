//
//  SectorCard.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/04.
//

import SwiftUI

struct SectorCard<Content>: View where Content: View{
    
    @ViewBuilder var content: Content
    
    var cardHeight: CGFloat = DesignConst.SectorCard.cardHeight
    var cardRadius: CGFloat = DesignConst.SectorCard.cardRadius
    var cardStrokeColor: Color = DesignConst.SectorCard.cardStrokeColor
    var cardBackgroundColor: Color = DesignConst.SectorCard.cardBackgroundColor
    
    var body: some View {
        
        VStack {
            content
        }
        .frame(maxWidth: .infinity)
        .frame(height: cardHeight)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: cardRadius)
                .stroke(cardStrokeColor)
        )
        .background(
            RoundedRectangle(cornerRadius: cardRadius)
                .fill(cardBackgroundColor)
        )
        
    }
}

struct SectorCard_Previews: PreviewProvider {
    static var previews: some View {
        SectorCard {
            Text("fewf")
        }
    }
}
