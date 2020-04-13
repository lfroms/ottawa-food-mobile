//
//  RestaurantCard.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import URLImage

struct RestaurantCard: View {
    let text: String
    let imageUrl: URL?
    let size: CGSize

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if imageUrl != nil {
                URLImage(imageUrl!) {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .frame(width: size.width, height: size.height)
            }

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 54)

            Text(text)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.bottom, 10)
        }
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .shadow(radius: 10)
        .frame(width: size.width, height: size.height)
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(
            text: "Restaurant",
            imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!,
            size: CGSize(width: 200, height: 200)
        )
    }
}
