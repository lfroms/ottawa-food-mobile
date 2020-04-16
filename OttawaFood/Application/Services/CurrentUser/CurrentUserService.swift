//
//  CurrentUserService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class CurrentUserService: ObservableObject {
    @Published private(set) var recommendations: [CurrentUserQuery.Data.CurrentUser.Recommendation.Node?] = []
    @Published private(set) var favorites: [CurrentUserQuery.Data.CurrentUser.FavoriteRestaurant.Node?] = []
    @Published private(set) var bucketListItems: [CurrentUserQuery.Data.CurrentUser.BucketListItem.Node?] = []

    public func fetch() {
        let query = CurrentUserQuery()

        GraphQL.shared.apollo.fetch(query: query, cachePolicy: .returnCacheDataAndFetch) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.favorites = data.currentUser?.favoriteRestaurants.nodes ?? []
                    self.bucketListItems = data.currentUser?.bucketListItems.nodes ?? []
                    self.recommendations = data.currentUser?.recommendations.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
