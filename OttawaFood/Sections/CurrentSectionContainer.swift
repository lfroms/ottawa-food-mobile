//
//  CurrentSectionContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSectionContainer: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        CurrentSection(section: appState.appSection)
            .equatable()
    }
}

struct CurrentSectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSectionContainer()
    }
}
