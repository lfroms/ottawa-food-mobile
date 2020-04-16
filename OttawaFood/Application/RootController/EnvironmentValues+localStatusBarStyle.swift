//
//  EnvironmentValues+localStatusBarStyle.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var localStatusBarStyle: LocalStatusBarStyle {
        return self[LocalStatusBarStyleKey.self]
    }
}
