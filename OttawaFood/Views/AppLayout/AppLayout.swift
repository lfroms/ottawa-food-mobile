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
            VStack(spacing: 0) {
                Color.primary.colorInvert().edgesIgnoringSafeArea(.top).frame(height: 1)

                ZStack(alignment: .bottom) {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 5) {
                            TopBar()
                                .padding(20)

                            CurrentSectionContainer()
                        }
                    }
                    .navigationBarItems(trailing: Text("search"))

                    TabBarContainer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
        }
        .overlay(SearchModal())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppLayout()
    }
}
