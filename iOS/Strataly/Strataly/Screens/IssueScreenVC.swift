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
		
		let issueTitle = STSmallTitle(issue?.title)
		let issueDescription = STLongText(text: issue?.description ?? "", maxWidth: Int(view.frame.width - 60))
		
		view.addSubview(issueTitle)
		view.addSubview(issueDescription)
		issueTitle.translatesAutoresizingMaskIntoConstraints = false
		issueDescription.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			issueTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			issueTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			issueTitle.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
			
			issueDescription.topAnchor.constraint(equalTo: issueTitle.bottomAnchor, constant: 10),
			issueDescription.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			issueDescription.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
			issueDescription.heightAnchor.constraint(equalToConstant: 250),
		])
    }
}
