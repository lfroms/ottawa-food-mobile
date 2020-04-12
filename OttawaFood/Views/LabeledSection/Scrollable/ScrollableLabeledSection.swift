//
//  ScrollableStackLabeledSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-12.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct ScrollableStackLabeledSection<Content: View>: View {
    private let label: String
    private let content: () -> Content
    
    @inlinable init(label: String, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.content = content
    }
    
    var body: some View {
        LabeledSection(label: label, labelInset: EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    self.content()
                }
                .padding(20)
            }
            .padding(.top, -20)
        }
    }
}

struct ScrollableLabeledSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableStackLabeledSection()
    }
}
