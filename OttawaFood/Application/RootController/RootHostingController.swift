//
//  RootHostingController.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

class RootHostingController<Content>: UIHostingController<Content> where Content: View {
    private var internalStyle = UIStatusBarStyle.default
    internal var didPresentOnboarding: Bool = false

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

        presentOnboardingIfNeeded()
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
