//
//  GenericSectionResponse.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 11/07/24.
//

import Foundation

struct GenericSectionResponse: Decodable {
	// MARK: - Attributes

	private(set) var title: TextModel
	private(set) var subtitle: TextModel
	private(set) var deeplink: String?
}
