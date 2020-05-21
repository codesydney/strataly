//
//  SceneDelegate.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
	var coordinator: LoginCoordinator?
	var window: UIWindow?
	
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
	{
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let navController = UINavigationController()
		coordinator = LoginCoordinator.init(navigationController: navController)
		coordinator?.setup()
		
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		window?.overrideUserInterfaceStyle = .dark
		window?.rootViewController = navController
		window?.makeKeyAndVisible()
	}
}
