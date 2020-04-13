//
//  FavoritesSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FavoritesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            MyFavoritesSectionContainer()
            AlsoLikeSectionContainer()
        }
        .padding(20)
        .navigationBarTitle(Text(AppSection.favorites.name))
    }
}

struct FavoritesSection_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesSection()
    }
}
