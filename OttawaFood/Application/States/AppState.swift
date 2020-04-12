//
//  AppState.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class AppState: ObservableObject {
    @Published var appSection: AppSection = .forYou
}
