//
//  SearchItem.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchItem<Content: View>: View {
    var content: () -> Content

    @inlinable init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        HStack(alignment: .center, spacing: 14) {
            Image(systemName: "mappin.and.ellipse")
                .font(Font.callout.weight(.bold))

            content()

            Spacer(minLength: 0)

            Image(systemName: "chevron.right")
                .font(Font.callout.weight(.bold))
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 20)
        .frame(height: 57)
        .background(Color.primary.colorInvert())
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.18), radius: 6, x: 0, y: 2)
    }
}

struct SearchItemButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchItem {
            Text("Test")
        }
    }
}
