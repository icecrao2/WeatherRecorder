//
//  ContentView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        
        VStack{
            WeatherView()
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
