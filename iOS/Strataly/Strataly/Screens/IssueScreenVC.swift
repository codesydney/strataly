//
//  IssueScreenVC.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 6/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class IssueScreenVC: UIViewController
{
	var coordinator: MainScreenCoordinator?
	
	var issue: Issue?
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		let title = UILabel()
		title.text = issue?.title
		
		view.addSubview(title)
		title.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			title.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
		])
    }
}
