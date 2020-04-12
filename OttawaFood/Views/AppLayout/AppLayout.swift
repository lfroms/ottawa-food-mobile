//
//  AppLayout.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-08.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct AppLayout: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    CurrentSectionContainer()
                }
                .navigationBarItems(trailing: Text("search"))

                TabBarContainer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppLayout()
    }
}
