//
//  AppServices.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppServices: ViewModifier {
    private static let appState: AppState = AppState()
    private static let trendingService: TrendingService = TrendingService()
    private static let ottawaFavoritesService: OttawaFavoritesService = OttawaFavoritesService()
    private static let featuredService: FeaturedService = FeaturedService()
    private static let restaurantViewState: RestaurantViewState = RestaurantViewState()
    private static let currentUserService: CurrentUserService = CurrentUserService()
    private static let youMayLikeService: YouMayLikeService = YouMayLikeService()

    func body(content: Content) -> some View {
        content
            .environmentObject(Self.appState)
            .environmentObject(Self.trendingService)
            .environmentObject(Self.ottawaFavoritesService)
            .environmentObject(Self.featuredService)
            .environmentObject(Self.restaurantViewState)
            .environmentObject(Self.currentUserService)
            .environmentObject(Self.youMayLikeService)
    }
}
