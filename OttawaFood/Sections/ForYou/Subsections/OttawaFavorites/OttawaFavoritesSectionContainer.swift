//
//  OttawaFavoritesSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct OttawaFavoritesSectionContainer: View {
    @EnvironmentObject private var ottawaFavoritesService: OttawaFavoritesService

    var body: some View {
        OttawaFavoritesSection(data: ottawaFavoritesService.ottawaFavorites)
            .onAppear {
                self.ottawaFavoritesService.fetch()
            }
    }
}

struct OttawaFavoritesSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        OttawaFavoritesSectionContainer()
    }
}
