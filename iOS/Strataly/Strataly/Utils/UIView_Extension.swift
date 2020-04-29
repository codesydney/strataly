//
//  UIView_Extension.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 3/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

extension UIView
{
	func setBackground(colors: [UIColor], type: CAGradientLayerType, startPoint: CGPoint, endPoint: CGPoint)
	{
		let gradientLayer = CAGradientLayer()
		gradientLayer.type = type
		gradientLayer.frame = bounds
		gradientLayer.colors = colors.map { $0.cgColor }
		gradientLayer.startPoint = startPoint
		gradientLayer.endPoint = endPoint
		
		// Remove current gradient sublayer
		if let subLayers = layer.sublayers
		{
			print("There are sublayers")
			for subLayer in subLayers
			{
				if let subLayer = subLayer as? CAGradientLayer
				{
					subLayer.removeFromSuperlayer()
					break
				}
			}
		}
		
		layer.insertSublayer(gradientLayer, at: 0)
	}
	
	func setBackground(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint)
	{
		setBackground(colors: colors, type: .axial, startPoint: startPoint, endPoint: endPoint)
	}
	
	func setBackground(colors: [UIColor], type: CAGradientLayerType)
	{
		setBackground(colors: colors, type: type, startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 1))
	}
	
	func setBackground(colors: [UIColor])
	{
		setBackground(colors: colors, type: .axial)
	}
}
