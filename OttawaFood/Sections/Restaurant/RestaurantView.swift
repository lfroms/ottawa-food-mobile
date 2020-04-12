//
//  RestaurantView.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantView: View {
    @Environment(\.imageCache) private var cache: ImageCache

    var didPerformDismiss: () -> Void
    var restaurant: RestaurantItem

    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: restaurant.imageUrl ?? URL(string: "")!, placeholder: Color.gray, cache: cache)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(1), Color.black.opacity(0)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 150)
            .edgesIgnoringSafeArea(.top)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: self.didPerformDismiss) {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(Font.system(size: 29).weight(.semibold))

                            Text(restaurant.text)
                                .font(.title)
                                .fontWeight(.heavy)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)

                    Rectangle()
                        .opacity(0)
                        .frame(height: 180)

                    Group {
                        Text("content")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.white)
                }
            }
        }
        .background(Color.primary.colorInvert().edgesIgnoringSafeArea(.all))
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(didPerformDismiss: {}, restaurant: RestaurantItem(text: "Test Restaurant", imageUrl: nil, targetObjectId: "1"))
    }
}
