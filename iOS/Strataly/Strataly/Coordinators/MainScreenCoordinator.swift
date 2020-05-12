//
//  MainScreenCoordinator.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 12/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class MainScreenCoordinator: Coordinator
{
	var children = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navController: UINavigationController) { self.navigationController = navController }
	
	func setup()
	{
		let vc = UserIssuesScreenVC()
		vc.coordinator = self
		
		navigationController.isToolbarHidden = true
		navigationController.pushViewController(vc, animated: true)
	}
	
	func issueSelected(_ issue: Issue)
	{
		let vc = IssueScreenVC()
		vc.coordinator = self
		vc.issue = issue
		
		navigationController.pushViewController(vc, animated: true)
	}
}
