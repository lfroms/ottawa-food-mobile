//
//  SignInController.swift
//  OttawaFood
//
//  Created by Lukas Romsicki on 2020-04-15.
//  Copyright © 2020 Lukas Romsicki. All rights reserved.
//

import AuthenticationServices
import UIKit

final class SignInController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 100
        return stackView
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(for: .title2, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Welcome to"
        label.textColor = UIColor.label
        return label
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(for: .largeTitle, weight: .heavy)
        label.adjustsFontForContentSizeCategory = true
        label.text = Application.appName
        label.textColor = .systemBlue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        
        setupStackView()
        setupAppLabels()
        setupProviderLoginView()
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupAppLabels() {
        labelStack.addArrangedSubview(welcomeLabel)
        labelStack.addArrangedSubview(appNameLabel)
        stackView.addArrangedSubview(labelStack)
    }
    
    private func setupProviderLoginView() {
        let authorizationButton =
            traitCollection.userInterfaceStyle == .dark
                ? ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .white)
                : ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .black)
        
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        authorizationButton.cornerRadius = .infinity
        
        authorizationButton.addTarget(self, action: #selector(didPressAuthorizationButton), for: .touchUpInside)
        
        stackView.subviews.first(where: { $0 is ASAuthorizationAppleIDButton })?.removeFromSuperview()
        stackView.addArrangedSubview(authorizationButton)
        
        NSLayoutConstraint.activate([
            authorizationButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            authorizationButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            authorizationButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func didPressAuthorizationButton() {
        presentAppleSignIn()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        let userInterfaceStyleDidChange = traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection)
        
        if userInterfaceStyleDidChange {
            setupProviderLoginView()
        }
    }
}

extension SignInController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        view.window!
    }
}
