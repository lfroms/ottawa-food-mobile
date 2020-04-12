//
//  OttawaFavoritesService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class OttawaFavoritesService: ObservableObject {
    private(set) var ottawaFavorites: [OttawaFavoritesQuery.Data.OttawaFavorite.Node?] = []

    public func fetch() {
        let query = OttawaFavoritesQuery()

        GraphQL.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.ottawaFavorites = data.ottawaFavorites.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
