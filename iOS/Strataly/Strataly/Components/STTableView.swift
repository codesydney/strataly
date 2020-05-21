//
//  STTableView.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 13/5/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class STTableView: UITableView
{
	init(controller: UITableViewDelegate & UITableViewDataSource)
	{
		super.init(frame: .zero, style: .plain)
		delegate = controller
		dataSource = controller
		layer.borderColor = UIColor.tertiarySystemBackground.cgColor
		layer.borderWidth = 2
		layer.cornerRadius = 16
		backgroundColor = .secondarySystemBackground
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
