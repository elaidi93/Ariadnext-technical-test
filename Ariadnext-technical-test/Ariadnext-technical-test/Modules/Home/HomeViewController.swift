//
//  HomeViewController.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet private weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self
		}
	}
	
	@IBOutlet private weak var inputBottom: NSLayoutConstraint!
	
	private var messages = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerKeyboardNotifications()
	}

	func registerKeyboardNotifications() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow(_:)),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
	 
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide(_:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	@objc
	func keyboardWillShow(_ sender: NSNotification) {
		let info = sender.userInfo!
		let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height

		inputBottom.constant = keyboardSize
		tableView.scrollToRow(at: IndexPath(row: 19, section: 0), at: .bottom, animated: true)
	}

	@objc
	func keyboardWillHide(_ sender: NSNotification) {
		inputBottom.constant = 0
		tableView.scrollToRow(at: IndexPath(row: 19, section: 0), at: .bottom, animated: true)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
