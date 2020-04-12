//
//  RestaurantViewTopSpacer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct RestaurantViewTopSpacer: View {
    var body: some View {
        Rectangle()
            .opacity(0)
            .frame(height: 180)
    }
}

struct RestaurantViewTopSpacer_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViewTopSpacer()
    }
}
