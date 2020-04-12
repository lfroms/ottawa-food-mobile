//
//  RestaurantCard.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantCard: View {
    @Environment(\.imageCache) private var cache: ImageCache

    let text: String
    let imageUrl: URL
    let size: CGSize

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: imageUrl, placeholder: Color.gray.opacity(0.5), cache: self.cache)
                .frame(width: size.width, height: size.height)
                .aspectRatio(2 / 3, contentMode: .fill)

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 84)

            Text(text)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.bottom, 15)
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
