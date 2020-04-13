//
//  ForYouSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ForYouSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            FeaturedSectionContainer()
            TrendingSectionContainer()
            OttawaFavoritesSectionContainer()
            YouMayLikeRecommendationRow()
        }
    }
}

struct ForYouSection_Previews: PreviewProvider {
    static var previews: some View {
        ForYouSection()
    }
}
