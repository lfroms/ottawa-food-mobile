//
//  AppServices.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppServices: ViewModifier {
    private static let appState: AppState = AppState()

    func body(content: Content) -> some View {
        content
            .environmentObject(Self.appState)
    }
}
