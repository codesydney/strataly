//
//  STTextArea.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 14/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STTextArea: UITextView
{
	init()
	{
		super.init(frame: .zero, textContainer: NSTextContainer())
		//super.init(frame: .zero, textContainer: NSTextContainer(size: CGSize(width: 200, height: 120)))
		layer.borderColor = UIColor.tertiarySystemBackground.cgColor
		layer.borderWidth = 2
		layer.cornerRadius = 16
		backgroundColor = .secondarySystemBackground
		font = UIFont.systemFont(ofSize: 16)
	}
	
	convenience init(text: String)
	{
		self.init()
		self.text = text
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
