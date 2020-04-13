//
//  OttawaFavoritesSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OttawaFavoritesSectionContainer: View {
    @EnvironmentObject private var ottawaFavoritesService: OttawaFavoritesService

    var body: some View {
        OttawaFavoritesSection(items: items)
            .id(items.count)
            .onAppear {
                self.ottawaFavoritesService.fetch()
            }
    }

    private var items: [RestaurantItem] {
        ottawaFavoritesService.ottawaFavorites.compactMap {
            guard let node = $0 else {
                return nil
            }

            var url: URL?

            if let imageUrl = node.restaurant.imageUrl {
                url = URL(string: imageUrl)!
            }

            return RestaurantItem(text: node.restaurant.name, imageUrl: url, targetObjectId: node.restaurant.id)
        }
    }
}

struct OttawaFavoritesSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        OttawaFavoritesSectionContainer()
    }
}
