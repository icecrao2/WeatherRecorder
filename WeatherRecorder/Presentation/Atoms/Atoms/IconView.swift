//
//  IconView.swift
//  WeatherRecorder
//
//  Created by sw on 2023/02/04.
//

import SwiftUI

struct IconView: View {
    var logoText: String = "☁️"
       
   var radius: CGFloat = 200
   var fontSize: CGFloat = 150
   
   var duration: CGFloat = 1
   
   var backgroundColor: Color = .blue
   
   @State var isStart: Bool = true
    func onAnimation() {
        isStart = true
    }
    
    var body: some View {
          ZStack {
              Circle()
                  .trim(from: 0, to: isStart ? 1 : 0)
                  .fill(backgroundColor)
                  .rotationEffect(.degrees(-90))
                  .animation(.easeInOut(duration: duration), value: isStart)
                  .frame(width: radius)
                  .onAppear{
                      onAnimation()
                  }
              
              Text(logoText)
                  .font(Font.system(size: fontSize))
          }
      }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
