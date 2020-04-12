//
//  RestaurantViewDimmer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewDimmer: View {
    @EnvironmentObject private var restaurantViewState: RestaurantViewState

    var body: some View {
        ZStack {
            if restaurantViewState.presented {
                Color.black.opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
            }
        }
    }
}

struct RestaurantViewDimmer_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewDimmer()
    }
}
