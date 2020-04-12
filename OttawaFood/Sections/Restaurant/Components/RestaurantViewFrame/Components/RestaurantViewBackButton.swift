//
//  RestaurantViewBackButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewBackButton: View {
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "chevron.left.circle.fill")
                    .font(Font.system(size: 29).weight(.semibold))

                Text(text)
                    .font(.title)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.white)
        }
    }
}

struct RestaurantViewBackButton_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewBackButton(text: "Back", action: {})
    }
}
