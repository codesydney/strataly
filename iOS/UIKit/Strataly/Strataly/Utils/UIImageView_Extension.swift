//
//  UIImageView_Extension.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 26/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

extension UIImageView
{
	// Function taken and adapted from:
	// https://useyourloaf.com/blog/adding-swift-convenience-initializers/
	convenience init?(imageNamed imageName: String, contentMode: UIView.ContentMode = .scaleToFill)
	{
		guard let image = UIImage(named: imageName) else { return nil }
		
		self.init(image: image)
		self.contentMode = contentMode
	}
}
