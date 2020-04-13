//
//  SearchSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchSection: View {
    @EnvironmentObject private var searchSectionState: SearchSectionState

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.primary.colorInvert()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

            VStack(alignment: .leading, spacing: 5) {
                SearchBar(
                    textFieldValue: $searchSectionState.query,
                    readOnly: false,
                    primaryIcon: "magnifyingglass",
                    auxiliaryIcon: "xmark",
                    auxiliaryAction: searchSectionState.togglePresentation
                )
                .padding(20)

                RestaurantPicker()
            }
        }
    }
}

struct SearchSection_Previews: PreviewProvider {
    static var previews: some View {
        SearchSection()
    }
}
