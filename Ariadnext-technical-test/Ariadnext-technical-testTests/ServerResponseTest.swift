//
//  ServerResponseTest.swift
//  Ariadnext-technical-testTests
//
//  Created by Hamza EL Aidi on 11/04/2022.
//

import XCTest
@testable import Ariadnext_technical_test
import Combine

class ServerResponseTest: XCTestCase {

	private var observers = Set<AnyCancellable>()
	
	func testResponse() {
		let serverResponseManager = ServerResponseManager()
		serverResponseManager.getResponse()
		serverResponseManager.serverResponse.sink { serverResponse in
			guard let serverResponse = serverResponse,
				  let messageEnum = ServerResponse(rawValue: serverResponse.message)
			else {
				XCTFail()
				return
			}
			XCTAssertEqual(serverResponse.message, messageEnum.rawValue)
		}.store(in: &observers)
	}

}
