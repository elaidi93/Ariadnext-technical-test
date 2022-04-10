//
//  MessageViewModalTest.swift
//  Ariadnext-technical-testTests
//
//  Created by Hamza EL Aidi on 11/04/2022.
//

import XCTest
@testable import Ariadnext_technical_test
import Combine

class MessageViewModalTest: XCTestCase {

	func testMessage() {
		let message = MessageViewModel(with: "  hello", sender: .client)
		XCTAssertEqual(message.message, "hello")
		XCTAssertEqual(message.sender, Sender.client)
	}
}
