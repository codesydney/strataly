//
//  LogoView.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STLogoView: UIView
{
	init(color: UIColor, width: CGFloat, height: CGFloat)
	{
		let maskFrame = CGRect(x: 0, y: 0, width: width, height: height)
		super.init(frame: maskFrame)
		
		let logoMask = UIImageView(image: UIImage(named: "strataly-logo"))
		logoMask.frame = maskFrame
		logoMask.contentMode = .scaleAspectFit
		mask = logoMask
		backgroundColor = color
	}
	
	convenience init(color: UIColor)
	{ self.init(color: color, width: 300, height: 100) }
	
	convenience init(color: UIColor, width: CGFloat)
	{ self.init(color: color, width: width, height: width / 3) }
	
	convenience init(color: UIColor, height: CGFloat)
	{ self.init(color: color, width: height * 3, height: height) }

	required init?(coder: NSCoder)
	{ fatalError("init(coder:) has not been implemented") }
}
