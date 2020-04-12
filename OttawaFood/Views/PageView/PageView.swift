//
//  PageView.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        PageViewController(controllers: viewControllers, currentPage: $currentPage)
//      PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView([Text("Test")])
    }
}
