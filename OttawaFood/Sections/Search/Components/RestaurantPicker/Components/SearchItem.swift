//
//  SearchItem.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearachItem<Content: View>: View {
    var color: Color
    var action: () -> Void
    var content: () -> Content

    @inlinable init(color: Color? = nil, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.color = color ?? Color(white: 0.09)
        self.action = action
        self.content = content
    }

    var body: some View {
        Button(action: self.action) {
            HStack(alignment: .center, spacing: 20) {
                content()
            }
            .padding(.horizontal, 20)
            .frame(height: 50)
            .background(color)
            .cornerRadius(14)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SearachItemButton_Previews: PreviewProvider {
    static var previews: some View {
        SearachItem(action: {}) {
            Text("Test")
        }
    }
}
