//
//  YouMayLikeService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class YouMayLikeService: ObservableObject {
    @Published private(set) var recommendations: [YouMayLikeQuery.Data.Recommendation.Node?] = []

    public func fetch() {
        let query = YouMayLikeQuery()

        GraphQL.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.recommendations = data.recommendations.nodes ?? []
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
