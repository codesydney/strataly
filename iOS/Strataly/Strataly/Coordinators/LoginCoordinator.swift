//
//  MainCoordinator.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class LoginCoordinator: NSObject, Coordinator, UINavigationControllerDelegate
{
	var children = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController)
	{ self.navigationController = navigationController }
	
	func setup()
	{
		// TODO: - replace this by verification if the user is logged in (on keychain)
		let loggedIn = false
		let vc: UIViewController
		
		if loggedIn
		{
			login(email: "", password: "")
		} else {
			vc = LoginScreenVC()
			(vc as! LoginScreenVC).coordinator = self
			navigationController.delegate = self
			navigationController.isNavigationBarHidden = true
			navigationController.pushViewController(vc, animated: false)
		}
		
	}
	
	func dismissCurrentScreen()
	{
		navigationController.popViewController(animated: true)
	}
	
	func login(email: String, password: String)
	{
		let child = MainScreenCoordinator(navController: navigationController)
		children.append(child)
		child.setup()
	}
	
	// MARK: - UINavigationControllerDelegate
	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
	{
		if let _ = fromVC as? LoginScreenVC
		{
			switch operation {
			case .push:
				return SlideAnimator(duration: TimeInterval(UINavigationController.hideShowBarDuration * 2), pushing: true)
			default:
				return SlideAnimator(duration: TimeInterval(UINavigationController.hideShowBarDuration * 2), pushing: false)
			}
		} else {
			return nil
		}
	}
}
