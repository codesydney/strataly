//
//  UIColor_Extension.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit


extension UIColor
{
	static var backgroundSkyLight: UIColor
	{
		return UIColor
			{ (UITraitCollection: UITraitCollection) -> UIColor in
				if UITraitCollection.userInterfaceStyle == .dark
					 { return UIColor.lightGray }
				else { return UIColor.white }
		}
	}
	
	static var backgroundSkyDark: UIColor
	{
		return UIColor
		{ (UITraitCollection: UITraitCollection) -> UIColor in
			if UITraitCollection.userInterfaceStyle == .dark
				 { return UIColor.darkGray }
			else { return UIColor.lightGray }
		}
	}
	
	static var mainScreenTitle = UIColor.black
}
