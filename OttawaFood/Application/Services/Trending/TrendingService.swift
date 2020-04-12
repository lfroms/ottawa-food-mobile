//
//  TrendingService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class TrendingService: ObservableObject {
    private(set) var trendingRestaurants: [TrendingQuery.Data.TrendingRestaurant.Node?] = []

    public func fetch() {
        let query = TrendingQuery()

        GraphQL.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.trendingRestaurants = data.trendingRestaurants.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
