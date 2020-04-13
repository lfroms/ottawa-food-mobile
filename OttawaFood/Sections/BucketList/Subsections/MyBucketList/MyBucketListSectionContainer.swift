//
//  MyBucketListSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MyBucketListSectionContainer: View {
    @EnvironmentObject private var currentUserService: CurrentUserService

    var body: some View {
        MyFavoritesSection(items: self.items)
            .equatable()
            .onAppear {
                self.currentUserService.fetch()
            }
    }

    private var items: [RestaurantItem] {
        currentUserService.bucketListItems.compactMap {
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

struct MyBucketListSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        MyBucketListSectionContainer()
    }
}
