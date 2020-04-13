//
//  SearchBarPlaceholder.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchBarPlaceholder: View, Equatable {
    var body: some View {
        Text("Find a restaurant")
            .fontWeight(.semibold)
            .foregroundColor(Color.secondary)
    }
}

struct SearchBarPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarPlaceholder()
    }
}
