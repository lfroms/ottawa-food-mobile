//
//  TopBar.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TopBar: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(appState.appSection.name)
                .font(.title)
                .fontWeight(.heavy)

            Spacer(minLength: 0)

            Image(systemName: "magnifyingglass")
                .font(Font.headline.weight(.semibold))
                .background(Circle().foregroundColor(Color.primary.opacity(0.1)).frame(width: 40, height: 40))
                .frame(width: 40, height: 40)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
