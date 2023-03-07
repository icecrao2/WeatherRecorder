//
//  SmallButton.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/04.
//

import SwiftUI

struct SmallButtonModifier: ViewModifier {
    
    var textColor: Color = .black
    var textDisableColor: Color = .gray
    var buttonStrokeColor: Color = DesignConst.Button.buttonStrokeColor
    var buttonBackgroundColor: Color = DesignConst.Colors.lightBlueColor
    var buttonBackgroundDisableColor: Color = DesignConst.Colors.grayColor
    var disabled: Bool = false
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(disabled ? textDisableColor : textColor)
            .frame(maxWidth: .infinity)
            .frame(height: DesignConst.Button.Height.smallButtonHeight)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(disabled ? buttonBackgroundDisableColor : buttonBackgroundColor)
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(buttonStrokeColor)
            )
            .disabled(disabled)
    }
    
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            //
        } label: {
            Text("few")
                .modifier(SmallButtonModifier())
        }

    }
}
