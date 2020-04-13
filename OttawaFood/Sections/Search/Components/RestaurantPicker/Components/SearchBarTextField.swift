//
//  SearchBarTextField.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchBarTextField<Placeholder: View & Equatable>: View, Equatable {
    @Binding var text: String

    var placeholder: Placeholder
    var commit: () -> () = {}

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }

            TextField("", text: $text, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .disableAutocorrection(true)
                // TextField is shifted upwards by 2 by default
                .padding(.top, 2)
        }
    }

    // MARK: - Equatable

    static func == (lhs: SearchBarTextField<Placeholder>, rhs: SearchBarTextField<Placeholder>) -> Bool {
        lhs.text == rhs.text && lhs.placeholder == rhs.placeholder
    }
}

struct SearchBarTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarTextField(text: .constant("Text"), placeholder: Text("Placeholder"))
    }
}
