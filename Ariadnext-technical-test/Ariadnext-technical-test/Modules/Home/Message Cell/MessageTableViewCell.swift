//
//  MessageTableViewCell.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import UIKit

class MessageTableViewCell: UITableViewCell, ReuseIdentifierProtocol {
	
	@IBOutlet private weak var serverMessageView: UIView! {
		didSet {
			update(view: serverMessageView)
		}
	}
	@IBOutlet private weak var clientMessageView: UIView! {
		didSet {
			update(view: clientMessageView)
		}
	}
	@IBOutlet private weak var serverMessageLabel: UILabel!
	@IBOutlet private weak var clientMessageLabel: UILabel!
	
	func show(message: String, for side: SideEnum) {
		switch side {
		case .server:
			clientMessageView.isHidden = true
			serverMessageView.isHidden = false
			serverMessageLabel.text = message
		case .client:
			clientMessageView.isHidden = false
			serverMessageView.isHidden = true
			clientMessageLabel.text = message
		}
	}
	
	private func update(view: UIView) {
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 8
	}
}
