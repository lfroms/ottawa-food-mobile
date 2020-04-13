//
//  FloatingButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    var symbolName: String
    var color: Color
    var toggled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .center) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(toggled ? color : .white)

                Image(systemName: symbolName)
                    .font(Font.system(size: 20).weight(.semibold))
                    .foregroundColor(toggled ? .white : color)
                    .padding(.top, 2)
            }
        }
        .buttonStyle(ShrinkOnPressButtonStyle())
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 2)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(symbolName: "heart.fill", color: .red, toggled: false, action: {})
    }
}
