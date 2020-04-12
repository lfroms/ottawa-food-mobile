//
//  RestaurantView.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantView: View {
    var restaurant: RestaurantItem

    var body: some View {
        RestaurantViewFrame(
            imageUrl: restaurant.imageUrl,
            backButtonText: restaurant.text
        ) {
            VStack(alignment: .leading, spacing: 30) {
                HStack(alignment: .center, spacing: 10) {
                    FloatingRating(text: "4.0")

                    Spacer(minLength: 0)

                    FloatingButton(symbolName: "bookmark.fill", color: .blue, action: {})
                    FloatingButton(symbolName: "heart.fill", color: .red, action: {})
                }
                .padding(.top, -25)

                Text(self.restaurant.text)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: RestaurantItem(text: "Test Restaurant", imageUrl: nil, targetObjectId: "1"))
    }
}
