//
//  SearchSectionState.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-13.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

final class SearchSectionState: ObservableObject {
    @Published var presented: Bool = false
    @Published var query: String = ""

    func togglePresentation() {
        withAnimation(.spring()) {
            self.presented.toggle()
        }
    }
}
