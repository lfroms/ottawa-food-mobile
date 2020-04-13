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
    var width: CGFloat?
    var height: CGFloat?

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 54)

            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.00001))

            Text(text)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.bottom, 10)
        }
        .frame(width: width, height: height, alignment: .bottomLeading)

        .background(
            Group {
                if imageUrl != nil {
                    URLImage(imageUrl!) {
                        $0.image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    }
                }
            }
            .allowsHitTesting(false)
        )
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(
            text: "Restaurant",
            imageUrl: URL(string: "https://www.blogto.com/listings/restaurants/upload/2012/09/20120919-sansoteiramen-miso.jpg")!,
            width: 200,
            height: 200
        )
    }
}
