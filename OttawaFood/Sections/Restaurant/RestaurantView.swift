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
            Text(self.restaurant.text)
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: RestaurantItem(text: "Test Restaurant", imageUrl: nil, targetObjectId: "1"))
    }
}
