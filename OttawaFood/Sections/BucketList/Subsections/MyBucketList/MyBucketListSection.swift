//
//  MyBucketListSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct MyBucketListSection: View {
    var items: [RestaurantItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(self.items, id: \.self) { item in
                NavigationLink(destination: RestaurantView(restaurant: item)) {
                    RestaurantCard(text: item.text, imageUrl: item.imageUrl, height: 131)
                }
                .buttonStyle(ShrinkOnPressButtonStyle())
            }
        }
        .padding(.horizontal, 20)
    }
}

struct MyBucketListSection_Previews: PreviewProvider {
    static var previews: some View {
        MyBucketListSection(items: [])
    }
}
