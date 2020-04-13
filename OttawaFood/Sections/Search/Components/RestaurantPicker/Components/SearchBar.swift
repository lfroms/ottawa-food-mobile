//
//  SearchBar.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchBar: View, Equatable {
    @Binding var textFieldValue: String

    var readOnly: Bool
    var primaryIcon: String
    var auxiliaryIcon: String

    var auxiliaryAction: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: primaryIcon)
                .equatable()

            SearchBarTextField(text: $textFieldValue, placeholder: SearchBarPlaceholder())
                .equatable()
                .disabled(readOnly)

            Button(action: auxiliaryAction) {
                Image(systemName: auxiliaryIcon)
                    .frame(height: 52)
                    .padding(.trailing, 20)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .font(Font.callout.weight(.bold))
        .padding(.leading, 20)
        .frame(height: 52)
        .background(Color.primary.opacity(0.07).cornerRadius(26))
    }

    // MARK: - Equatable

    static func == (lhs: SearchBar, rhs: SearchBar) -> Bool {
        lhs.textFieldValue == rhs.textFieldValue
            && lhs.readOnly == rhs.readOnly
            && lhs.primaryIcon == rhs.primaryIcon
            && lhs.auxiliaryIcon == rhs.auxiliaryIcon
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue

            SearchBar(
                textFieldValue: .constant("Test"),
                readOnly: false,
                primaryIcon: "magnifyingglass",
                auxiliaryIcon: "xmark.circle.fill",
                auxiliaryAction: {}
            )
            .padding(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
