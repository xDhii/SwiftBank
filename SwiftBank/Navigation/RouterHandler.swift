//
//  RouterHandler.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 15/07/24.
//

import Foundation

enum DeeplinkURL: String {
	case loan
	case pix
	case error
}

struct RouterHandler {
	func find(from url: URL) async -> Route? {
		guard let host = url.host() else {
			return nil
		}

		switch DeeplinkURL(rawValue: host) {
			case .loan:

				let queryParameters = url.queryParameters
				let id = queryParameters?["id"] as? String ?? ""
				let amount = queryParameters?["amount"] as? String ?? ""

				return .loan(id: id, amount: amount)
			case .pix:
				return .pix
			case .error:
				return .error
			default:
				return nil
		}
	}
}
