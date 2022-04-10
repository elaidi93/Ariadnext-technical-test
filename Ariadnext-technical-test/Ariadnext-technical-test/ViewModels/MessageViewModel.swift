//
//  MessageViewModel.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import Foundation

class MessageViewModel {
	
	var message: String
	var date: Date
	var sender: Sender
	
	init(with message: String, sender: Sender) {
		self.message = message.trimmingCharacters(in: .whitespacesAndNewlines)
		self.sender = sender
		date = Date()
	}
}
