//
//  RestaurantViewFrame.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI
import URLImage

struct RestaurantViewFrame<Content: View>: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.localStatusBarStyle) private var statusBarStyle

    private var imageUrl: URL?
    private var backButtonText: String
    private var content: () -> Content

    @inlinable init(
        imageUrlString: String?,
        backButtonText: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.imageUrl = URL(string: imageUrlString ?? "")
        self.backButtonText = backButtonText
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            if imageUrl != nil {
                URLImage(imageUrl!) { component in
                    GeometryReader { geometry in
                        component.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: 300)
                            .clipped()
                    }
                }
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            } else {
                Color.gray
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.top)
            }

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
                        .padding(20)

                    RestaurantViewTopSpacer()

                    content()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                        .background(Color.primary.colorInvert())
                }
            }
        }
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
        RestaurantViewFrame(imageUrlString: nil, backButtonText: "Back") {
            Text("Content")
        }
    }
}
