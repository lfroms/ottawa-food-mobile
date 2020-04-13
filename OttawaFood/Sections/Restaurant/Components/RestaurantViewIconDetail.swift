//
//  RestaurantViewIconDetail.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewIconDetail: View {
    var symbolName: String
    var color: Color
    var text: String

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: symbolName)
                .font(Font.system(size: 20).weight(.semibold))
                .foregroundColor(color)

            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
    }
}

struct RestaurantViewIconDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewIconDetail(symbolName: "phone", color: .green, text: "123456789")
    }
}
