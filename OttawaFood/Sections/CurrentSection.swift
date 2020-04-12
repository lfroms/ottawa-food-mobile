//
//  CurrentSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct CurrentSection: View {
    let section: AppSection

    var body: some View {
        Group {
            if section == .forYou {
                ForYouSection()
            }

            if section == .favorites {
                FavoritesSection()
            }

            if section == .bucketList {
                BucketListSection()
            }

            if section == .profile {
                ProfileSection()
            }
        }
    }
}

extension CurrentSection: Equatable {}

struct CurrentSection_Previews: PreviewProvider {
    static var previews: some View {
        CurrentSection(section: .forYou)
    }
}
