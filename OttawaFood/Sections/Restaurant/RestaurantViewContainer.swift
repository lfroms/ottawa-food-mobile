//
//  RestaurantViewContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewContainer: View {
    @EnvironmentObject private var restaurantViewState: RestaurantViewState

    var body: some View {
        ZStack {
            if restaurantViewState.presented {
                RestaurantView(didPerformDismiss: restaurantViewState.togglePresentation, restaurant: restaurantViewState.currentRestaurant)
                    .transition(.move(edge: .trailing))
            }
        }
    }

    private func handlePickerDismiss() {
        restaurantViewState.togglePresentation()
    }
}

struct RestaurantViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewContainer()
    }
}
