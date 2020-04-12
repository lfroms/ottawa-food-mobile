//
//  RestaurantView.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantView: View {
    @Environment(\.localStatusBarStyle) var statusBarStyle
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.imageCache) private var cache: ImageCache

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
                    RestaurantViewBackButton(text: restaurant.text, action: self.didPressBackButton)
                        .padding(.top, 10)
                        .padding(.horizontal, 20)

                    RestaurantViewTopSpacer()

                    Group {
                        Text("content")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                    .background(Color.primary.colorInvert())
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            self.statusBarStyle.currentStyle = .lightContent
        }
    }

    private func didPressBackButton() {
        self.statusBarStyle.currentStyle = .default
        self.mode.wrappedValue.dismiss()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: RestaurantItem(text: "Test Restaurant", imageUrl: nil, targetObjectId: "1"))
    }
}
