//
//  BucketListSection.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-11.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import SwiftUI

struct BucketListSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            MyBucketListSectionContainer()
            YouMayLikeRecommendationRow()
        }
        .navigationBarTitle(Text(AppSection.bucketList.name))
    }
}

struct BucketListSection_Previews: PreviewProvider {
    static var previews: some View {
        BucketListSection()
    }
}
