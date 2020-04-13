//
//  SearchButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchButton: View {
    @EnvironmentObject private var searchSectionState: SearchSectionState

    var body: some View {
        Button(action: searchSectionState.togglePresentation) {
            Image(systemName: "magnifyingglass")
                .font(Font.headline.weight(.semibold))
                .background(Circle().foregroundColor(Color.primary.opacity(0.07)).frame(width: 40, height: 40))
                .frame(width: 40, height: 40)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
    }
}
