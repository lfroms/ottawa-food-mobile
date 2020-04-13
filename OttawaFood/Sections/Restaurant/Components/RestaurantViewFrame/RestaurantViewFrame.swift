//
//  RestaurantViewFrame.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewFrame<Content: View>: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.localStatusBarStyle) private var statusBarStyle
    @Environment(\.imageCache) private var cache: ImageCache

    private var imageUrl: URL?
    private var backButtonText: String
    private var content: () -> Content

    @inlinable init(
        imageUrl: URL?,
        backButtonText: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.imageUrl = imageUrl
        self.backButtonText = backButtonText
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: imageUrl ?? URL(string: "http://apple.com")!, placeholder: Color.gray, cache: cache)
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
                    RestaurantViewBackButton(text: backButtonText, action: self.didPressBackButton)
                        .padding(.top, 10)
                        .padding(.horizontal, 20)

                    RestaurantViewTopSpacer()

                    content()
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

struct RestaurantViewFrame_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewFrame(imageUrl: nil, backButtonText: "Back") {
            Text("Content")
        }
    }
}
