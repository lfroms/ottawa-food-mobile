//
//  TabBarFiller.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabBarFiller: View {
    var body: some View {
        Rectangle()
            .opacity(0)
            .frame(height: 70)
    }
}

struct TabBarFiller_Previews: PreviewProvider {
    static var previews: some View {
        TabBarFiller()
    }
}
