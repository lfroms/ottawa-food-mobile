//
//  SignIn+Authorization.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import AuthenticationServices

extension SignInController {
    public func presentAppleSignIn() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()

        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self

        authorizationController.performRequests()
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension SignInController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        }

        var name = "No Name"

        if let fullName = appleIDCredential.fullName {
            var nameComponents: [String] = []

            if let givenName = fullName.givenName {
                nameComponents.append(givenName)
            }

            if let familyName = fullName.familyName {
                nameComponents.append(familyName)
            }

            if nameComponents.count > 0 {
                name = nameComponents.joined(separator: " ")
            }
        }

        if let jwtData = appleIDCredential.identityToken,
            let jwt = String(data: jwtData, encoding: .utf8) {
            self.validateAppleIDSession(name: name, jwt: jwt)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        Alert.displayGenericError()
    }
}

// MARK: - Validate Apple ID Session

extension SignInController {
    public func validateAppleIDSession(name: String, jwt: String) {
        Session.shared.validate(name: name, jwt: jwt) {
            self.navigationController?.pushViewController(ReadyController(), animated: true)
        }
    }
}
