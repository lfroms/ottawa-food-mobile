//
//  FeaturedCard.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import URLImage

struct FeaturedCard: View {
    let data: RestaurantItem

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if data.imageUrl != nil {
                URLImage(data.imageUrl!) {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .frame(minHeight: 216, maxHeight: 216)
            }

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 84)

            Text(data.text)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 15)
        }
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(data:
            RestaurantItem(
                text: "Test",
                imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!,
                targetObjectId: "0"
            )
        )
    }
}
