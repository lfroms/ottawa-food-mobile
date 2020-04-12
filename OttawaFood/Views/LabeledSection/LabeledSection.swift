//
//  LabeledSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct LabeledSection<Content: View>: View {
    let label: String
    let labelInset: EdgeInsets
    let content: () -> Content

    @inlinable init(
        label: String,
        labelInset: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
        @ViewBuilder content: @escaping () -> Content)
    {
        self.label = label
        self.labelInset = labelInset
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(label)
                .font(.headline)
                .fontWeight(.bold)
                .padding(labelInset)

            content()
        }
    }
}

struct LabeledSection_Previews: PreviewProvider {
    static var previews: some View {
        LabeledSection(label: "Section") {
            Text("Test")
        }
    }
}
