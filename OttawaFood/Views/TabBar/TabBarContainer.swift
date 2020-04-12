//
//  TabBarContainer.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabBarContainer: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        TabBar(tabs: AppSection.list, activeTab: $appState.appSection)
    }
}

struct TabBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabBarContainer()
    }
}
