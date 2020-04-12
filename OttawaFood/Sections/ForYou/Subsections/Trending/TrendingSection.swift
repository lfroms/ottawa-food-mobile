//
//  TrendingSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TrendingSection: View {
    var data: [TrendingQuery.Data.TrendingRestaurant.Node?]

    var body: some View {
        ScrollableStackLabeledSection(label: "Trending") {
            ForEach(0..<self.restaurantCards.count) { index in
                self.restaurantCards[index]
            }
        }
    }

    private var restaurantCards: [RestaurantCard] {
        data.compactMap {
            guard let node = $0 else {
                return nil
            }

            var url: URL?

            if let imageUrl = node.restaurant.imageUrl {
                url = URL(string: imageUrl)!
            }

            return RestaurantCard(text: node.restaurant.name, imageUrl: url, size: CGSize(width: 162, height: 131))
        }
    }
}

struct TrendingSection_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSection(data: [])
    }
}
