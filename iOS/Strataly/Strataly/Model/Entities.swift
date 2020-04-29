//
//  Entities.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 12/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import Foundation


class Strata: Codable
{
	var strataPlanId: String
	var name: String
	var officeAddress: String?
	var officePhone: String?
	var officeEmail: String?
	var strataAddress: String?
	
	init(planID: String, name: String)
	{
		strataPlanId = planID
		self.name = name
	}
}

class Role: Codable
{
	var name: String
	var description: String?
	
	init(name: String) { self.name = name }
}

class User: Codable
{
	var userId: Int?
	var name: String
	var email: String?
	var password: String?
	var strata: Strata?
	var unit: String?
	var role: Role?
	var phone: String?
	var userStatus: String?
	var creationTime: Date?
	
	required init(name: String)
	{
		self.name = name
	}
}

class Issue: Codable
{
	let issueId: Int
	var title: String
	var description: String
	var user: User
	var status: String // IssueStatus?
	let creationTime: Date
	var lastUpdate: Date
}

class IssueComment: Codable
{
	var commentId: Int
	let issue: Issue
	var user: User
	var comment: String
	var commentTime: Date
}

class IssueFile: Codable
{
	let fileId: Int
	let description: String
	let fileData: Data
	let user: User
	let issue: Issue
	let uploadTime: Date
}
