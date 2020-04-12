//
//  TouchScaleButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TouchScaleButton<Content: View>: View {
    private let action: () -> Void
    private let content: () -> Content

    @State private var isPressing: Bool = false

    @inlinable init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }

    var body: some View {
        Button(action: action) {
            content()
        }
        .buttonStyle(ShrinkOnPressButtonStyle())
    }
}

struct TouchScaleButton_Previews: PreviewProvider {
    static var previews: some View {
        TouchScaleButton(action: {}) {
            Text("Test content")
        }
    }
}
