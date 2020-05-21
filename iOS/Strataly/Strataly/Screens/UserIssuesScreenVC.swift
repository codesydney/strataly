//
//  UserIssuesScreenVC.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 21/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class UserIssuesScreenVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	var coordinator: MainScreenCoordinator?
	
	var issueTableView: UITableView!
	
	var user: User!
	var issues: [Issue]!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		view.backgroundColor = .black
		
		user = User.random()
		issues = user.fetchIssues()
		
		let logo = STLogoView(color: .label, height: 50)
		let userNameLabel = STTitle(user.name)
		let userEmailLabel = STSmallText(user.email ?? "(no email address)")
		let userRoleLabel = STText(user.role == nil ? "No role" : user.role!.name)
		let strataNameLabel = STText("\(user.strata == nil ? "No strata" : user.strata!.name)'s issues:")
		
		issueTableView = STTableView(controller: self)
		issueTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		logo.translatesAutoresizingMaskIntoConstraints = false
		userNameLabel.translatesAutoresizingMaskIntoConstraints = false
		userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
		userRoleLabel.translatesAutoresizingMaskIntoConstraints = false
		strataNameLabel.translatesAutoresizingMaskIntoConstraints = false
		issueTableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(logo)
		view.addSubview(userNameLabel)
		view.addSubview(userEmailLabel)
		view.addSubview(userRoleLabel)
		view.addSubview(strataNameLabel)
		view.addSubview(issueTableView)
		
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			logo.widthAnchor.constraint(equalToConstant: 150),
			logo.heightAnchor.constraint(equalToConstant: 50),
			
			userNameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
			userNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			userNameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
			userNameLabel.heightAnchor.constraint(equalToConstant: 36),
			
			userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
			userEmailLabel.centerXAnchor.constraint(equalTo: userNameLabel.centerXAnchor),
			userEmailLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor),
			userEmailLabel.heightAnchor.constraint(equalToConstant: 14),
			
			userRoleLabel.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 5),
			userRoleLabel.centerXAnchor.constraint(equalTo: userNameLabel.centerXAnchor),
			userRoleLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor),
			userRoleLabel.heightAnchor.constraint(equalToConstant: 20),
			
			strataNameLabel.topAnchor.constraint(equalTo: userRoleLabel.bottomAnchor, constant: 30),
			strataNameLabel.centerXAnchor.constraint(equalTo: userNameLabel.centerXAnchor),
			strataNameLabel.widthAnchor.constraint(equalTo: userNameLabel.widthAnchor),
			strataNameLabel.heightAnchor.constraint(equalToConstant: 20),
			
			issueTableView.topAnchor.constraint(equalTo: strataNameLabel.bottomAnchor, constant: 10),
			issueTableView.centerXAnchor.constraint(equalTo: userNameLabel.centerXAnchor),
			issueTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
			issueTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
		])
    }
	
	// MARK: - UITableViewDataSource methods
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		issues.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { fatalError() }
		
		cell.textLabel?.text = issues[indexPath.row].title
		cell.backgroundColor = .secondarySystemBackground
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		coordinator?.issueSelected(issues[indexPath.row])
	}
}
