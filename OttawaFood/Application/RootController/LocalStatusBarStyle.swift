//
//  LocalStatusBarStyle.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

class LocalStatusBarStyle {
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = { _ in }

    var currentStyle: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}
