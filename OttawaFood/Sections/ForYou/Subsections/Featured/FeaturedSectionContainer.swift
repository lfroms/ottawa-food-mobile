//
//  FeaturedSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FeaturedSectionContainer: View {
    var body: some View {
        FeaturedSection(pages: pages)
            .equatable()
    }

    private var pages: [RestaurantItem] {
        return [
            RestaurantItem(text: "Test", imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!, targetObjectId: "1"),
            RestaurantItem(text: "Test", imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!, targetObjectId: "2"),
            RestaurantItem(text: "Test", imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!, targetObjectId: "3")
        ]
    }
}

struct FeaturedSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedSectionContainer()
    }
}
