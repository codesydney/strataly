//
//  MainCoordinator.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate
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
			vc = UserIssuesScreenVC()
			(vc as! UserIssuesScreenVC).coordinator = self
		} else {
			vc = MainScreenVC()
			(vc as! MainScreenVC).coordinator = self
		}
		
		navigationController.delegate = self
		navigationController.isNavigationBarHidden = true
		navigationController.pushViewController(vc, animated: false)
	}
	
	func dismissCurrentScreen()
	{
		navigationController.popViewController(animated: true)
	}
	
	func login(userName: String, password: String)
	{
		print("user name: \(userName)")
		print("password: \(password)")
		let vc = UserIssuesScreenVC()
		vc.coordinator = self
		
		navigationController.pushViewController(vc, animated: true)
	}
	
	// MARK: - UINavigationControllerDelegate
	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
	{
		if let _ = fromVC as? MainScreenVC {
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
