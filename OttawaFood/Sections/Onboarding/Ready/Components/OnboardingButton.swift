//
//  OnboardingButton.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

final class OnboardingButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .tertiarySystemFill
        layer.cornerRadius = 12
        contentHorizontalAlignment = .left
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 0, left: bounds.width - 45, bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageView!.frame.width)
        }
    }
}
