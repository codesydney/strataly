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
		let firstNames = ["Uluru", "Cook", "Coogee", "Walla Walla", "Gundaroo", "Manly", "Yarra", "Flinders", "Queen's", "King's", "Prince's", "Kangaroo", "Rainbow", "Bondi", "Sydney", "Darwin", ]
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
		let prenames = ["Anthony", "Bethany", "Carl", "Denise", "Earl", "Fiona", "Gus", "Hannah", "Ian", "Jessica", "Ken", "Leah", "Maurice", "Natalie", "Otis", "Patricia", "Quincy", "Rachael", "Simon", "Thea", "Ugo", "Vanessa", "William", "Xena", "Ygor", "Zadie"]
		let surnames = ["Saldanha", "Gomes", "de la Croix", "McIntire", "Williamson", "Silva", "Gruber", "Steiner", "Novik", "Ivanov", "Dubois", "Horvat", "Olsen", "Roux", "O'Connor", "Bianco", "de Vries", "Rocha", "Machado", "Castro", "Navarro", "van Dijk"]
		
		let user = User(name: "\(prenames.randomElement()!) \(surnames.randomElement()!)")
		user.email = "\(user.name.lowercased().replacingOccurrences(of: " ", with: "-"))@strataly.com.au"
		user.creationTime = Date()
		user.phone = "0404 040 404"
		user.role = Role.random()
		user.strata = Strata.random()
		user.unit = "32A"
		user.userStatus = "Active"
		
		return user
	}
}

extension Role
{
	static func random() -> Role
	{
		let listOfRoles = ["Executive Committee", "Strata Manager", "Building Manager", "Owner", "Tenant"]
		
		return Role(name: listOfRoles.randomElement()!)
	}
}
