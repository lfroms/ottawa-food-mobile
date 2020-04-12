//
//  OttawaFavoritesSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OttawaFavoritesSection: View {
    var items: [RestaurantItem]

    var body: some View {
        ScrollableStackLabeledSection(label: "Ottawa favourites") {
            ForEach(self.items, id: \.self) { item in
                TouchScaleButton(action: {}) {
                    RestaurantCard(text: item.text, imageUrl: item.imageUrl, size: CGSize(width: 162, height: 131))
                }
            }
        }
    }
}

struct OttawaFavoritesSection_Previews: PreviewProvider {
    static var previews: some View {
        OttawaFavoritesSection(items: [])
    }
}
