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

enum Role: Int, Codable
{
	case unauthorized = 0
	case admin
	case executiveCommittee
	case strataManager
	case buildingManager
	case owner
	case tenant
	
	var name: String
	{
		switch self
		{
		case .admin: return "Strataly Administrator"
		case .executiveCommittee: return "Executive Committee"
		case .strataManager: return "Strata Manager"
		case .buildingManager: return "Building Manager"
		case .owner: return "Owner"
		case .tenant: return "Tenant"
		default: return "Unauthorized"
		}
	}
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
	var issueId: Int?
	var title: String
	var description: String?
	var user: User?
	var status: String? // IssueStatus?
	let creationTime: Date?
	var lastUpdate: Date?
	var comments: [IssueComment]?
	var files: [IssueFile]?
	
	init(title: String)
	{
		self.title = title
		creationTime = Date()
	}
}

class IssueComment: Codable
{
	var commentId: Int
	weak var issue: Issue
	weak var user: User
	var comment: String
	var commentTime: Date
	
	
}

class IssueFile: Codable
{
	let fileId: Int
	let description: String
	let fileData: Data
	weak let user: User
	weak let issue: Issue
	let uploadTime: Date
}
