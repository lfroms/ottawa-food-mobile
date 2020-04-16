//
//  Application.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

final class Application {
    static var appName: String {
        Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    }
}
