//
//  YouMayLikeRecommendationRow.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct YouMayLikeRecommendationRow: View {
    @EnvironmentObject private var youMayLikeService: YouMayLikeService

    var body: some View {
        ScrollableStackLabeledSection(label: "You may also like") {
            ForEach(self.items, id: \.self) { item in
                NavigationLink(destination: RestaurantView(restaurant: item)) {
                    RestaurantCard(text: item.text, imageUrl: item.imageUrl, width: 162, height: 131)
                }
                .buttonStyle(ShrinkOnPressButtonStyle())
            }
        }
        .onAppear {
            self.youMayLikeService.fetch()
        }
    }

    private var items: [RestaurantItem] {
        youMayLikeService.recommendations.compactMap {
            guard let node = $0 else {
                return nil
            }

            var url: URL?

            if let imageUrl = node.restaurant.imageUrl {
                url = URL(string: imageUrl)!
            }

            return RestaurantItem(text: node.restaurant.name ?? "", imageUrl: url, targetObjectId: node.restaurant.yelpId)
        }
    }
}

struct YouMayLikeRecommendationRow_Previews: PreviewProvider {
    static var previews: some View {
        YouMayLikeRecommendationRow()
    }
}
