//
//  IndicatorShape.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct IndicatorShape: View {
    let size: CGFloat
    let weight: CGFloat
    let color: Color

    var body: some View {
        return Circle()
            .trim(from: 0.25, to: 1)
            .stroke(color, lineWidth: weight)
            .frame(width: size, height: size)
    }
}

struct IndicatorShape_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorShape(size: 12, weight: 3, color: .white)
    }
}
