//
//  UIView+ReuseIdentifier.swift
//  Ariadnext-technical-test
//
//  Created by Hamza EL Aidi on 10/04/2022.
//

import Foundation

protocol ReuseIdentifierProtocol {
	static var reuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol {
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}
