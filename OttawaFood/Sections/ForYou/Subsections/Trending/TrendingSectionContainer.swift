//
//  TrendingSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TrendingSectionContainer: View {
    @EnvironmentObject private var trendingService: TrendingService

    var body: some View {
        TrendingSection(data: trendingService.trendingRestaurants)
            .onAppear {
                self.trendingService.fetch()
            }
    }
}

struct TrendingSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSectionContainer()
    }
}

