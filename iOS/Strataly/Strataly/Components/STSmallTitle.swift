//
//  STTitle.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 13/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STSmallTitle: UILabel
{
	init(_ text: String?)
	{
		super.init(frame: .zero)
		self.text = text
		numberOfLines = 2
		font = UIFont.systemFont(ofSize: 22)
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
