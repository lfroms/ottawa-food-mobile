//
//  ReadyController.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import UIKit

final class ReadyController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 100
        return stackView
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(for: .title1, weight: .heavy)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Ready!"
        label.textColor = .label
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(for: .body, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.text = "You're ready to get started with \(Application.appName)"
        label.textColor = .secondaryLabel
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var checkmark: UIView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        
        let iconConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 78, weight: .medium), scale: .default)
        let icon = UIImage(systemName: "checkmark.circle.fill")
        let iconView = UIImageView(image: icon)
        iconView.preferredSymbolConfiguration = iconConfiguration
        iconView.tintColor = .systemGreen
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(iconView)
        
        return stack
    }()
    
    private lazy var finishButton: UIButton = {
        let button = OnboardingButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .label
        button.isUserInteractionEnabled = true
        
        button.setAttributedTitle(
            NSAttributedString(
                string: "Get started",
                attributes: [
                    NSAttributedString.Key.font: UIFont.preferredFont(for: .callout, weight: .bold),
                ]
            ),
            for: .normal
        )
        
        let iconConfiguration = UIImage.SymbolConfiguration(font: .preferredFont(for: .title3, weight: .bold), scale: .default)
        let icon = UIImage(systemName: "chevron.right.circle.fill")
        let iconView = UIImageView(image: icon)
        iconView.preferredSymbolConfiguration = iconConfiguration
        
        button.setImage(iconView.image, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        finishButton.addTarget(self, action: #selector(didPressGetStarted), for: .touchUpInside)
        
        setupStackView()
        setupLabels()
        setupIcon()
        setupFinishButton()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func setupLabels() {
        labelStack.addArrangedSubview(titleLabel)
        labelStack.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(labelStack)
    }
    
    private func setupFinishButton() {
        stackView.addArrangedSubview(finishButton)
        
        NSLayoutConstraint.activate([
            finishButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
        ])
    }
    
    private func setupIcon() {
        stackView.addArrangedSubview(checkmark)
    }
    
    @objc private func didPressGetStarted() {
        navigationController?.dismiss(animated: true)
    }
}
