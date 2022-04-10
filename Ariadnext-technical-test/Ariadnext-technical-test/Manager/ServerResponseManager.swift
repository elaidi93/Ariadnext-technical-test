//
//  ServerResponseManager.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import Foundation
import Combine

class ServerResponseManager {
	
	let serverResponse = PassthroughSubject<MessageViewModel?, Never>()
	
	func getResponse(of message: MessageViewModel, deadline: Double = 3.0) {
		DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
			self.serverResponse.send(MessageViewModel(with: ServerResponse.allCases.randomElement()?.rawValue ?? ServerResponse.bonjour.rawValue, sender: .server))
		}
	}
}
