//
//  CurrentUserService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class CurrentUserService: ObservableObject {
    @Published private(set) var favorites: [CurrentUserQuery.Data.CurrentUser.FavoriteRestaurant.Node?] = []

    public func fetch() {
        let query = CurrentUserQuery()

        GraphQL.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.favorites = data.currentUser?.favoriteRestaurants.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}