//
//  RestaurantViewService.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import SwiftUI

final class RestaurantViewService: ObservableObject {
    @Published private(set) var restaurant: RestaurantMutation.Data.CreateOrRetrieveRestaurant.Restaurant?
    @Published private(set) var bucketListed: Bool = false

    public func fetch(id: GraphQLID) {
        let mutation = RestaurantMutation(yelpId: id)

        GraphQL.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.restaurant = data.createOrRetrieveRestaurant?.restaurant
                    self.bucketListed = data.createOrRetrieveRestaurant?.restaurant.inBucketList ?? false
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    public func toggleFavorite(id: GraphQLID) {
        let mutation = ToggleFavoriteMutation(yelpId: id)

        GraphQL.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.restaurant?.favorite = data.toggleFavoriteRestaurant?.restaurant.favorite ?? false
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    public func toggleBucketListItem(id: GraphQLID) {
        if bucketListed {
            deleteBucketListItem(id: id)
        } else {
            createBucketListItem(id: id)
        }
    }

    private func createBucketListItem(id: GraphQLID) {
        let mutation = CreateBucketListItemMutation(yelpId: id)

        GraphQL.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if graphQLResult.data != nil {
                    self.bucketListed = true
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    private func deleteBucketListItem(id: GraphQLID) {
        let mutation = DeleteBucketListItemMutation(yelpId: id)

        GraphQL.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if graphQLResult.data != nil {
                    self.bucketListed = false
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
