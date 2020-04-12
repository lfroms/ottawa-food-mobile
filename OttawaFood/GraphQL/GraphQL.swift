//
//  GraphQL.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Apollo
import Foundation

final class GraphQL {
    static let shared = GraphQL()

    private let serverAddress = "http://localhost:3000/graphql"

    private(set) lazy var apollo = ApolloClient(url: URL(string: serverAddress)!)
}
