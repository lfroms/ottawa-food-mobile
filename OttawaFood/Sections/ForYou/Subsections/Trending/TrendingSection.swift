//
//  TrendingSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TrendingSection: View {
    var items: [RestaurantItem]

    var body: some View {
        ScrollableStackLabeledSection(label: "Trending") {
            ForEach(self.items, id: \.self) { item in
                NavigationLink(destination: RestaurantView(restaurant: item)) {
                    RestaurantCard(text: item.text, imageUrl: item.imageUrl, size: CGSize(width: 162, height: 131))
                }
                .buttonStyle(ShrinkOnPressButtonStyle())
            }
        }
    }
}

struct TrendingSection_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSection(items: [])
    }
}
