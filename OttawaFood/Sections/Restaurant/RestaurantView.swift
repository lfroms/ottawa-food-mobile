//
//  RestaurantView.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantView: View {
    @ObservedObject private var service = RestaurantViewService()

    var restaurant: RestaurantItem

    var body: some View {
        RestaurantViewFrame(
            imageUrlString: service.restaurant?.imageUrl,
            backButtonText: restaurant.text
        ) {
            VStack(alignment: .leading, spacing: 30) {
                HStack(alignment: .center, spacing: 10) {
                    FloatingRating(text: self.service.restaurant?.yelpRating ?? "")

                    Spacer(minLength: 0)

                    FloatingButton(
                        symbolName: "bookmark.fill",
                        color: .blue,
                        toggled: self.service.bucketListed,
                        action: self.didToggleBucketList
                    )
                    FloatingButton(
                        symbolName: "heart.fill",
                        color: .red,
                        toggled: self.service.restaurant?.favorite ?? false,
                        action: self.didToggleFavorite
                    )
                }
                .padding(.top, -25)

                VStack(alignment: .leading, spacing: 18) {
                    if self.service.restaurant?.phone != nil {
                        RestaurantViewIconDetail(symbolName: "phone.circle.fill", color: .green, text: self.service.restaurant!.phone!)
                    }

                    if self.service.restaurant?.priceLevel != nil {
                        RestaurantViewIconDetail(symbolName: "dollarsign.circle.fill", color: .orange, text: self.service.restaurant!.priceLevel!)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            self.service.fetch(id: self.restaurant.targetObjectId)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    private func didToggleFavorite() {
        service.toggleFavorite(id: restaurant.targetObjectId)
        UISelectionFeedbackGenerator().selectionChanged()
    }

    private func didToggleBucketList() {
        service.toggleBucketListItem(id: restaurant.targetObjectId)
        UISelectionFeedbackGenerator().selectionChanged()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: RestaurantItem(text: "Test Restaurant", imageUrl: nil, targetObjectId: "1"))
    }
}
