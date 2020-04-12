//
//  FeaturedSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FeaturedSection: View {
    let action: (RestaurantItem) -> Void
    let pages: [RestaurantItem]

    var body: some View {
        PageView(self.mappedPages)
            .frame(height: 216)
    }

    private var mappedPages: [AnyView] {
        pages.compactMap { page in
            AnyView(
                NavigationLink(destination: RestaurantView(restaurant: page)) {
                    FeaturedCard(data: page)
                }
                .buttonStyle(ShrinkOnPressButtonStyle())
            )
        }
    }
}

extension FeaturedSection: Equatable {
    static func == (lhs: FeaturedSection, rhs: FeaturedSection) -> Bool {
        lhs.pages == rhs.pages
    }
}

struct FeaturedSection_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedSection(action: { _ in }, pages: [])
    }
}
