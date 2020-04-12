//
//  TrendingSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TrendingSectionContainer: View {
    @EnvironmentObject private var trendingService: TrendingService

    var body: some View {
        TrendingSection(items: self.items)
            .id(items.count)
            .onAppear {
                self.trendingService.fetch()
            }
    }

    private var items: [RestaurantItem] {
        trendingService.trendingRestaurants.compactMap {
            guard let node = $0 else {
                return nil
            }

            var url: URL?

            if let imageUrl = node.restaurant.imageUrl {
                url = URL(string: imageUrl)!
            }

            return RestaurantItem(text: node.restaurant.name, imageUrl: url, targetObjectId: node.id)
        }
    }
}

struct TrendingSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSectionContainer()
    }
}
