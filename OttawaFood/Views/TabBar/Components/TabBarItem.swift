//
//  TabBarItem.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabBarItem: View {
    let tab: AppSection
    @Binding var activeTab: AppSection

    var body: some View {
        Button(action: self.didPressTab) {
            Image(systemName: modifiedSymbolName)
                .foregroundColor(color)
                .font(Font.system(size: 20).weight(.semibold))
        }
    }

    private var modifiedSymbolName: String {
        guard tab == activeTab else {
            return tab.symbolName
        }

        return "\(tab.symbolName).fill"
    }

    private var color: Color {
        guard tab == activeTab else {
            return .black
        }

        return tab.color
    }

    private func didPressTab() {
        activeTab = tab
    }
}

extension TabBarItem: Equatable {
    static func == (lhs: TabBarItem, rhs: TabBarItem) -> Bool {
        lhs.tab == rhs.tab && lhs.activeTab == rhs.activeTab
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(tab: .forYou, activeTab: .constant(.forYou))
    }
}
