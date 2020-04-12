//
//  TabBar.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    let tabs: [AppSection]
    @Binding var activeTab: AppSection

    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Group {
                        TabBarItem(tab: tab, activeTab: self.$activeTab)

                        if tab != self.tabs.last {
                            Spacer(minLength: 0)
                        }
                    }
                }
            }
            .padding(.horizontal, 42)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color.primary.colorInvert().edgesIgnoringSafeArea(.all))
        }
        .shadow(color: .black, radius: 55, x: 0, y: 50)
    }
}

extension TabBar: Equatable {
    static func == (lhs: TabBar, rhs: TabBar) -> Bool {
        lhs.tabs == rhs.tabs && lhs.activeTab == rhs.activeTab
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(tabs: [], activeTab: .constant(.forYou))
    }
}
