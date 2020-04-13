//
//  SearchSectionState.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class SearchSectionState: NSObject, ObservableObject {
    @Published private(set) var presented: Bool = false
    @Published var query: String = "" {
        didSet {
            if query.isEmpty {
                results = []
                return
            }

            loading = true
            debounce(#selector(search), after: 2)
        }
    }

    @Published private(set) var loading: Bool = false
    @Published var results: [RestaurantItem] = []

    func togglePresentation() {
        withAnimation(.spring()) {
            self.presented.toggle()
        }
    }

    @objc public func search() {
        let graphQLQuery = SearchQuery(query: query)

        GraphQL.shared.apollo.fetch(query: graphQLQuery) { result in
            self.loading = false

            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    self.results = data.search.compactMap {
                        RestaurantItem(text: $0.name, imageUrl: nil, address: $0.address, targetObjectId: $0.yelpId)
                    }
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
