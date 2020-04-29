//
//  MainScreenViewController.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController
{
	var coordinator: MainCoordinator?
	
	private var block = UIView()
	private var logo = LogoView(color: .mainScreenTitle)
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		view.setBackground(colors: [.backgroundSkyLight, .backgroundSkyDark], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0.2))
		
		let silhouette = UIImageView(imageNamed: "city-skyline-1")
		silhouette?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
		block.mask = silhouette
		block.backgroundColor = .systemBackground
		view.addSubview(block)
		block.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(logo)
		logo.translatesAutoresizingMaskIntoConstraints = false
		
		var loginScreenFrame = view.bounds
		loginScreenFrame.origin = CGPoint(x: 0, y: 182)
		let loginScreen = LoginScreen(frame: loginScreenFrame, loginAction: loginTapped)
		view.addSubview(loginScreen)
		loginScreen.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			logo.heightAnchor.constraint(equalToConstant: 92),
			logo.widthAnchor.constraint(equalToConstant: 300),
			logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			
			block.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: -20),
			block.heightAnchor.constraint(equalToConstant: 80),
			block.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
			
			loginScreen.topAnchor.constraint(equalTo: block.bottomAnchor),
			loginScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			loginScreen.rightAnchor.constraint(equalTo: view.rightAnchor),
			loginScreen.leftAnchor.constraint(equalTo: view.leftAnchor),
		])
    }
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?)
	{
		view.setBackground(colors: [.backgroundSkyLight, .backgroundSkyDark], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0.2))
	}
	
	func loginTapped(_ userName: String, _ password: String)
	{
		coordinator?.login(userName: userName, password: password)
	}
}
