//
//  CreditCardResponse.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 10/07/24.
//

import Foundation

struct CreditCardResponse: Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case icon
		case subtitle
		case value
		case dueDate = "due_date"
	}

	// MARK: - Attributes

	private(set) var title: TextModel
	private(set) var icon: String
	private(set) var subtitle: TextModel
	private(set) var value: TextModel
	private(set) var dueDate: TextModel
}
