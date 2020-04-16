//
//  RootHostingController+Onboarding.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

extension RootHostingController {
    func presentOnboardingIfNeeded() {
        guard shouldPresentOnboarding else {
            return
        }

        let onboarding = OnboardingNavigationController(rootViewController: SignInController())
        onboarding.modalPresentationStyle = .fullScreen

        present(onboarding, animated: false) {
            self.didPresentOnboarding = true
        }
    }

    private var shouldPresentOnboarding: Bool {
        !didPresentOnboarding && !Session.shared.tokenExists()
    }
}
