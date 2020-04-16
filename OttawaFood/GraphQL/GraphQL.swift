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

    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "http://localhost:3000/graphql")!)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

extension GraphQL: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        let tokenFromKeychain = Session.shared.retrieveToken()

        guard let token = tokenFromKeychain else {
            return
        }

        var headers = request.allHTTPHeaderFields ?? [String: String]()
        headers["Authorization"] = "Bearer \(token)"

        request.allHTTPHeaderFields = headers
    }
}
