//
//  SearchModal.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct SearchModal: View {
    @EnvironmentObject private var searchSectionState: SearchSectionState

    var body: some View {
        ZStack {
            if searchSectionState.presented {
                SearchSection()
                    .transition(.move(edge: .bottom))
            }
        }
    }

    private func handlePickerDismiss() {
        searchSectionState.togglePresentation()
    }
}

struct SearchModal_Previews: PreviewProvider {
    static var previews: some View {
        SearchModal()
    }
}
