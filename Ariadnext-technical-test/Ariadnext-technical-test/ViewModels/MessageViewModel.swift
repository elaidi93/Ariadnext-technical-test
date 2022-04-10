//
//  MessageViewModel.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import Foundation

class MessageViewModel {
	
	var message: String? {
		get {
			self.message
		}
		set {
			self.message = newValue?.trimmingCharacters(in: .whitespacesAndNewlines)
		}
	}
	var date: Date?
	var sender: SideEnum?
}
