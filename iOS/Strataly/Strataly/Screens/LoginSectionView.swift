//
//  LoginScreen.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 12/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class LoginSectionView: UIView
{
	let emailTextField = UITextField()
	let passwordTextField = UITextField()
	let loginButton = UIButton()
	
	var action: (String, String) -> Void
	
	init(frame: CGRect, loginAction: @escaping (String, String) -> Void)
	{
		action = loginAction
		super.init(frame: frame)
		backgroundColor = .systemBackground
		
		let emailLabel = UILabel()
		emailLabel.text = "E-mail"
		emailLabel.textAlignment = .natural
		addSubview(emailLabel)
		emailLabel.translatesAutoresizingMaskIntoConstraints = false
		
		emailTextField.placeholder = "Enter your e-mail address"
		emailTextField.textAlignment = .natural
		emailTextField.keyboardType = .emailAddress
		emailTextField.autocapitalizationType = .none
		emailTextField.borderStyle = .roundedRect
		addSubview(emailTextField)
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		
		let passwordLabel = UILabel()
		passwordLabel.text = "Password"
		passwordLabel.textAlignment = .natural
		addSubview(passwordLabel)
		passwordLabel.translatesAutoresizingMaskIntoConstraints = false
		
		passwordTextField.placeholder = "Enter your password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.textAlignment = .natural
		passwordTextField.passwordRules = .none
		passwordTextField.autocapitalizationType = .none
		passwordTextField.borderStyle = .roundedRect
		addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		
		loginButton.setTitle("Log in", for: .normal)
		loginButton.setTitleColor(.label, for: .normal)
		loginButton.layer.borderWidth = 1
		loginButton.layer.borderColor = UIColor.label.cgColor
		loginButton.layer.cornerRadius = 5
		loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
		addSubview(loginButton)
		loginButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.175),
			emailLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
			emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			emailLabel.heightAnchor.constraint(equalToConstant: 40),
			
			emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
			emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
			emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			emailTextField.heightAnchor.constraint(equalToConstant: 40),
			
			passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
			passwordLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
			passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			passwordLabel.heightAnchor.constraint(equalToConstant: 40),
			
			passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
			passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
			passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
			passwordTextField.heightAnchor.constraint(equalToConstant: 40),
			
			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
			loginButton.widthAnchor.constraint(equalToConstant: 120),
			loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			loginButton.heightAnchor.constraint(equalToConstant: 40),
		])
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	@objc func loginTapped()
	{
		let email = emailTextField.text ?? ""
		let pwd = passwordTextField.text ?? ""
		
		action(email, pwd)
	}
}
