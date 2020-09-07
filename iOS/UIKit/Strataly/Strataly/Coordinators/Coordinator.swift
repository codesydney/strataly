//
//  Coordinator.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

protocol Coordinator
{
	var children: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func setup()
}
