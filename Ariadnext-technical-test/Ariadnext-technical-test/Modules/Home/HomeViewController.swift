//
//  HomeViewController.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
	
	@IBOutlet private weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self
			tableView.register(UINib(nibName: MessageTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MessageTableViewCell.reuseIdentifier)
		}
	}
	
	@IBOutlet private weak var inputBottom: NSLayoutConstraint!
	@IBOutlet private weak var messageText: UITextField!
	
	private var messages = [MessageViewModel]()
	private var cancellable: AnyCancellable?
	
	var serverResponseManager: ServerResponseManager?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		registerKeyboardNotifications()
		messages.append(MessageViewModel(with: ServerResponse.bonjour.rawValue, sender: .server))
		tableView.reloadData()
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
		guard let info = sender.userInfo,
			  let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
		else { return }

		inputBottom.constant = keyboardSize
		if messages.count > 0 {
			tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
		}
	}

	@objc
	func keyboardWillHide(_ sender: NSNotification) {
		inputBottom.constant = 0
		if messages.count > 0 {
			tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
		}
	}
	
	@IBAction private func send() {
		guard let text = messageText.text,
			  !text.isEmpty
		else { return }
		let message = MessageViewModel(with: text, sender: .client)
		messages.append(message)
		tableView.reloadData()
		messageText.text = nil
		getServerResponse(of: message)
	}
	
	private func getServerResponse(of message: MessageViewModel) {
		serverResponseManager?.getResponse(of: message)
		cancellable = serverResponseManager?.serverResponse
			.receive(on: DispatchQueue.main)
			.sink { [weak self] serverResponse in
			guard let serverResponse = serverResponse
			else { return }
			self?.messages.append(serverResponse)
			self?.tableView.reloadData()
		}
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.reuseIdentifier) as? MessageTableViewCell
		else { return UITableViewCell() }
		cell.configure(with: messages[indexPath.row])
		return cell
	}
}
