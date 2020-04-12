//
//  AppSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

enum AppSection: String {
    case forYou = "For You"
    case favorites = "Favorites"
    case bucketList = "Bucket List"
    case profile = "Profile"

    var name: String {
        self.rawValue
    }

    var symbolName: String {
        switch self {
        case .forYou:
            return "star"
        case .favorites:
            return "heart"
        case .bucketList:
            return "bookmark"
        case .profile:
            return "person.circle"
        }
    }

    var color: Color {
        switch self {
        case .forYou:
            return Color.yellow
        case .favorites:
            return Color.red
        case .bucketList:
            return Color.blue
        case .profile:
            return Color.green
        }
    }

    static let list: [AppSection] = [.forYou, .favorites, .bucketList, .profile]
}
