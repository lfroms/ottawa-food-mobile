//
//  FloatingRating.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct FloatingRating: View {
    let text: String

    var body: some View {
        ZStack(alignment: .center) {
            Capsule()
                .frame(width: 98, height: 44)
                .foregroundColor(Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 2)

            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(text)
                    .font(.headline)
                    .fontWeight(.heavy)

                Image(systemName: "star.fill")
                    .font(Font.headline.weight(.heavy))
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct FloatingRating_Previews: PreviewProvider {
    static var previews: some View {
        FloatingRating(text: "4.0")
    }
}
