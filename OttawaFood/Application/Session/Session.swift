//
//  Session.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import AuthenticationServices
import Foundation
import KeychainAccess

final class Session: NSObject {
    static let shared = Session()

    private let keychain = Keychain(service: "com.romsicki.OttawaFood")
    private let tokenKey = "token"

    public func validate(name: String, jwt: String, completion: @escaping () -> Void) {
        let mutation = ValidateAppleIdMutation(name: name, token: jwt)

        GraphQL.shared.apollo.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data, let token = data.validateAppleId?.token {
                    self.saveToken(token: token)
                    completion()
                } else {
                    self.displayLoginError()
                }

            case .failure(let error):
                self.displayLoginError()
                print(error)
            }
        }
    }

    public func retrieveToken() -> String? {
        keychain[tokenKey]
    }

    public func tokenExists() -> Bool {
        keychain[tokenKey] != nil
    }

    public func clearToken() {
        keychain[tokenKey] = nil
    }

    private func saveToken(token: String) {
        keychain[tokenKey] = token
    }

    private func displayLoginError() {
        Alert.display(title: "Error", message: "We're unable to sign you in right now. Please try again later.")
    }
}
