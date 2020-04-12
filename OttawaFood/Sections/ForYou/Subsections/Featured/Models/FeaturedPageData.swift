//
//  FeaturedPageData.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import Foundation

struct FeaturedPageData: Equatable, Hashable {
    let text: String
    let imageUrl: URL
    let targetObjectId: Int
}
