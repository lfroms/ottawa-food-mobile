//
//  SearchSubsection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchSubsection<Content: View>: View {
    var label: String
    var value: String?

    @Binding var loading: Bool

    var content: () -> Content

    init(label: String, value: String? = nil, loading: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self.label = label
        self.value = value
        self._loading = loading
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .firstTextBaseline, spacing: 12) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(label)
                        .font(.callout)
                        .fontWeight(.semibold)

                    if value != nil {
                        Text(" \(value!)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }

                Spacer()

                if loading {
                    AppActivityIndicator()
                }
            }

            content()
        }
    }
}

struct SearchSubsection_Previews: PreviewProvider {
    static var previews: some View {
        SearchSubsection(label: "Test section", loading: .constant(false)) {
            EmptyView()
        }
    }
}
