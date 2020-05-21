//
//  STTitle.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 13/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STTitle: UILabel
{
	init(_ text: String)
	{
		super.init(frame: .zero)
		self.text = text
		font = UIFont.systemFont(ofSize: 32)
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
