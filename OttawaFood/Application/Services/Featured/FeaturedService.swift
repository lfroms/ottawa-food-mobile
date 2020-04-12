//
//  FeaturedService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class FeaturedService: ObservableObject {
    @Published private(set) var featured: [FeaturedQuery.Data.Recommendation.Node?] = []

    public func fetch() {
        let query = FeaturedQuery()

        GraphQL.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.featured = data.recommendations.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
