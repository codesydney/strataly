//
//  STLongText.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 14/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STLongText: UIScrollView
{
	private let longLabel = UILabel()
	
	var text: String?
	{
		get {
			longLabel.text
		}
		
		set {
			longLabel.text = newValue
		}
	}
	
	init(text: String?, maxWidth: Int)
	{
		super.init(frame: .zero)
		
		longLabel.text = text
		longLabel.numberOfLines = 0
		longLabel.font = UIFont.systemFont(ofSize: 16)
		longLabel.backgroundColor = .clear
		
		layer.borderColor = UIColor.tertiarySystemBackground.cgColor
		layer.borderWidth = 2
		layer.cornerRadius = 10
		backgroundColor = .secondarySystemBackground
		
		addSubview(longLabel)
		longLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			longLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			longLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
			longLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			longLabel.widthAnchor.constraint(equalToConstant: CGFloat(maxWidth - 16)),
		])
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
