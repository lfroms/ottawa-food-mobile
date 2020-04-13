//
//  RestaurantPicker.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantPicker: View {
    var query: String
    var loading: Bool
    var items: [RestaurantItem]

    var body: some View {
        SearchSubsection(label: "Results for", value: query, loading: .constant(loading)) {
            VStack(spacing: 16) {
                ForEach(self.items, id: \.self) { item in
                    NavigationLink(destination: RestaurantView(restaurant: item)) {
                        SearchItem {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.text)
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                    .truncationMode(.tail)

                                Text(item.address ?? "")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(ShrinkOnPressButtonStyle())
                }
            }
        }
        .padding(.vertical, 20 / 2)
        .padding(.horizontal, 20)
    }
}

struct RestaurantPicker_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantPicker(query: "Test", loading: false, items: [])
    }
}
