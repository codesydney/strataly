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
	var coordinator: MainCoordinator?
	
	var issueTableView: UITableView!
	
	var user: User!
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		view.backgroundColor = .black
		
		user = User.random()
		let logo = LogoView(color: .label, height: 50)
		let userNameLabel = UILabel()
		let userEmailLabel = UILabel()
		let userRoleLabel = UILabel()
		let strataNameLabel = UILabel()
		
		issueTableView = UITableView()
		issueTableView.delegate = self
		issueTableView.dataSource = self
		issueTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		issueTableView.layer.borderColor = UIColor.tertiarySystemBackground.cgColor
		issueTableView.layer.borderWidth = 2
		issueTableView.layer.cornerRadius = 16
		issueTableView.backgroundColor = .secondarySystemBackground
		
		userNameLabel.text = user.name
		userEmailLabel.text = user.email
		userRoleLabel.text = user.role == nil ? "No role" : user.role!.name
		strataNameLabel.text = "\(user.strata == nil ? "No strata" : user.strata!.name)'s issues:"
		
		userNameLabel.font = UIFont.systemFont(ofSize: 32)
		userEmailLabel.font = UIFont.systemFont(ofSize: 12)
		userRoleLabel.font = UIFont.systemFont(ofSize: 18)
		strataNameLabel.font = UIFont.systemFont(ofSize: 18)
		
		userEmailLabel.textColor = .secondaryLabel
		
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
		10
	}
	
	// TODO: - Show some real content
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		{
			cell.textLabel?.text = "Issue \(indexPath.row) - Unit \(Int.random(in: 1...99))'s \(["broken door", "rubbish placing", "garage", "maintenance", "pipe work", "parking problem"].randomElement() ?? "problem")"
			cell.backgroundColor = .secondarySystemBackground
			return cell
		} else {
			return UITableViewCell()
		}
	}
}
