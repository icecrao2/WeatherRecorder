//
//  WeatherEmotionListView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/07.
//

import SwiftUI

struct WeatherEmotionListView: View {
    
    @StateObject private var viewModel: SeoulWeatherViewModel = SeoulWeatherViewModel()
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            Text("Status")
            
            List{
                ForEach(viewModel.getEmotion(), id: \.self) { emotion in
                    Text("\(emotion.date)")
                }
            }
            
        }
    }
}

struct WeatherEmotionListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEmotionListView()
    }
}
