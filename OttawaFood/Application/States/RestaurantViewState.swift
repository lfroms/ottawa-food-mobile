//
//  RestaurantViewState.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class RestaurantViewState: ObservableObject {
    @Published var presented: Bool = false

    public func togglePresentation() {
        withAnimation(.spring()) {
            presented.toggle()
        }
    }

    @Published var currentRestaurant: RestaurantItem = RestaurantItem(text: "Helo", imageUrl: nil, targetObjectId: "1")
}
