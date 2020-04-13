//
//  MyFavoritesSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MyFavoritesSectionContainer: View {
    @EnvironmentObject private var currentUserService: CurrentUserService

    var body: some View {
        MyFavoritesSection(items: self.items)
            .equatable()
            .onAppear {
                self.currentUserService.fetch()
            }
    }

    private var items: [RestaurantItem] {
        currentUserService.favorites.compactMap {
            guard let node = $0 else {
                return nil
            }

            var url: URL?

            if let imageUrl = node.imageUrl {
                url = URL(string: imageUrl)!
            }

            return RestaurantItem(text: node.name, imageUrl: url, targetObjectId: node.id)
        }
    }
}

struct MyFavoritesSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoritesSectionContainer()
    }
}
