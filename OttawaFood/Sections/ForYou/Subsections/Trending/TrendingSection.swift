//
//  TrendingSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TrendingSection: View {
    var body: some View {
        LabeledSection(label: "Trending", labelInset: EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    RestaurantCard(text: "Test", imageUrl: URL(string: "asdf")!, size: CGSize(width: 162, height: 131))
                    RestaurantCard(text: "Test", imageUrl: URL(string: "asdf")!, size: CGSize(width: 162, height: 131))
                    RestaurantCard(text: "Test", imageUrl: URL(string: "asdf")!, size: CGSize(width: 162, height: 131))
                    RestaurantCard(text: "Test", imageUrl: URL(string: "asdf")!, size: CGSize(width: 162, height: 131))
                }
                .padding(20)
            }
            .padding(.top, -20)
        }
    }
}

struct TrendingSection_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSection()
    }
}
