//
//  SearchButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "magnifyingglass")
                .font(Font.headline.weight(.semibold))
                .background(Circle().foregroundColor(Color.primary.opacity(0.1)).frame(width: 40, height: 40))
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
