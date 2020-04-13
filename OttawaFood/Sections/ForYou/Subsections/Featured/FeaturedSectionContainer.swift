//
//  FeaturedSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FeaturedSectionContainer: View {
    @EnvironmentObject private var restaurantViewState: RestaurantViewState
    @EnvironmentObject private var featuredService: FeaturedService

    var body: some View {
        FeaturedSection(action: self.didSelectRestaurant(_:), pages: pages)
            .equatable()
            .onAppear {
                self.featuredService.fetch()
            }
    }

    private var pages: [RestaurantItem] {
        self.featuredService.featured.compactMap {
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

    private func didSelectRestaurant(_ restaurant: RestaurantItem) {
        self.restaurantViewState.currentRestaurant = restaurant
        self.restaurantViewState.togglePresentation()
    }
}

struct FeaturedSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedSectionContainer()
    }
}
