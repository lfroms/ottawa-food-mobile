//
//  RootHostingController.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

class LocalStatusBarStyle {
    fileprivate var getter: () -> UIStatusBarStyle = { .default }
    fileprivate var setter: (UIStatusBarStyle) -> Void = { _ in }

    var currentStyle: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

struct LocalStatusBarStyleKey: EnvironmentKey {
    static let defaultValue: LocalStatusBarStyle = LocalStatusBarStyle()
}

extension EnvironmentValues { // Environment key path variable
    var localStatusBarStyle: LocalStatusBarStyle {
        return self[LocalStatusBarStyleKey.self]
    }
}

class RootHostingController<Content>: UIHostingController<Content> where Content: View {
    private var internalStyle = UIStatusBarStyle.default
    private var didPresentOnboarding: Bool = false

    @objc open dynamic override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            internalStyle
        }
        set {
            internalStyle = newValue
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard !self.didPresentOnboarding else {
            return
        }

        let onboarding = OnboardingNavigationController(rootViewController: SignInController())
        onboarding.modalPresentationStyle = .fullScreen

        present(onboarding, animated: false) {
            self.didPresentOnboarding = true
        }
    }

    override init(rootView: Content) {
        super.init(rootView: rootView)

        LocalStatusBarStyleKey.defaultValue.getter = { self.preferredStatusBarStyle }
        LocalStatusBarStyleKey.defaultValue.setter = { self.preferredStatusBarStyle = $0 }
    }

    @objc dynamic required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
