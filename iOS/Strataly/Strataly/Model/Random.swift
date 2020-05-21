//
//  Random.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 21/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import Foundation


extension Strata
{
	static func random() -> Strata
	{
		let firstNames = ["Uluru", "Cook", "Coogee", "Walla Walla", "Gundaroo", "Manly", "Yarra", "Flinders", "Queen's", "King's", "Prince's", "Kangaroo", "Paradise", "Bondi", "Sydney", "Darwin", ]
		let secondNames = ["Garden", "Tower", "Point", "Palace", "Condo", ]
		let planIDInt = Int.random(in: 10000...99999)
		let strata = Strata(planID: "\(planIDInt)", name: "\(firstNames.randomElement()!) \(secondNames.randomElement()!)")
		return strata
	}
}

extension User
{
	static func random() -> User
	{
		let prenames = ["Anthony", "Bethany", "Carl", "Denise", "Earl", "Fiona", "Gustavo", "Hannah", "Ian", "Jessica", "Ken", "Leah", "Maurice", "Natalie", "Otis", "Patricia", "Quincy", "Rachael", "Simon", "Thea", "Ugo", "Vanessa", "William", "Xena", "Ygor", "Zadie"]
		let surnames = ["Saldanha", "Gomes", "de la Croix", "McIntire", "Williamson", "Silva", "Gruber", "Steiner", "Novik", "Ivanov", "Dubois", "Horvat", "Olsen", "Roux", "O'Connor", "Bianco", "de Vries", "Rocha", "Machado", "Castro", "Navarro", "van Dijk"]
		
		let user = User(name: "\(prenames.randomElement()!) \(surnames.randomElement()!)")
		user.creationTime = Date()
		user.phone = "0404 040 404"
		user.role = Role.random()
		user.strata = Strata.random()
		user.unit = "32A"
		user.userStatus = "Active"
		user.email = "\(user.name.lowercased().replacingOccurrences(of: " ", with: "-"))@\(user.strata!.name.lowercased().replacingOccurrences(of: " ", with: "-")).com.au"
		
		return user
	}
	
	func fetchIssues() -> [Issue]
	{
		return Issue.random(in: 3...15)
	}
}

extension Role
{
	static func random() -> Role
	{
		let role: Role = Role.init(rawValue: Int.random(in: 1...6)) ?? Role.unauthorized
		return role
	}
}


extension Issue
{
	static func random() -> Issue
	{
		let part1 = ["Problem with", "Unit's ", "Issue of", "Complications with", "Possible breach regarding", ]
		let part2 = ["parking spot", "leaky plumbing", "broken door", "electric wiring", "fire hazard", "flooding hazard", "health hazard", "general waste", "recyclable garbage", "dumping area", ]
		
		let specifier = Bool.random() ? "Unit \(Int.random(in: 10...99)) - " : ""
		let issue = Issue(title: "\(specifier)\(part1.randomElement()!) \(part2.randomElement()!)")
		
		issue.description = Lorem.paragraphs(1...3)
		issue.lastUpdate = issue.creationTime
		issue.status = "Submitted"
		issue.user = User.random()
		
		return issue
	}
	
	static func random(in range: ClosedRange<Int>) -> [Issue]
	{
		var issues = [Issue]()
		let quantity = Int.random(in: range.lowerBound..<range.upperBound)
		for _ in 1...quantity { issues.append(random()) }
		return issues
	}
	
	static func random(in range: Range<Int>) -> [Issue]
	{
		var issues = [Issue]()
		let quantity = Int.random(in: range.lowerBound...range.upperBound)
		for _ in 1...quantity { issues.append(random()) }
		return issues
	}
}
