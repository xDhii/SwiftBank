//
//  HomeViewModel.swift
//  SwiftBank
//
//  Created by Alura on 03/01/24.
//

import Foundation

class HomeViewModel: ObservableObject {
	// MARK: - Attributes

	private let service: HomeServiceable
	@Published var screenModel: HomeModel?

	// MARK: - Initialize

	init(service: HomeServiceable) {
		self.service = service
	}

	// MARK: - API Calls

	func getHome() async throws {
		let result = try await service.getHome()

		switch result {
			case let .success(response):
				DispatchQueue.main.async {
					self.screenModel = response
				}
			case let .failure(error):
				throw error
		}
	}

	func buildSections() throws -> [GenericSectionView] {
		var sections: [GenericSectionView] = []
		guard let items = screenModel?.items else {
			return []
		}

		for section in items {
			switch section.type {
				case .balance:
					guard let model: BalanceResponse = section.content.decode() else {
						throw RequestError.decode
					}
					sections.append(BalanceSection(model: model))
				case .creditCard:
					guard let model: CreditCardResponse = section.content.decode() else {
						throw RequestError.decode
					}
					sections.append(CreditCardSection(model: model))
				case .genericSection:
					guard let model: GenericSectionResponse = section.content.decode() else {
						throw RequestError.decode
					}
					sections.append(GenericSection(model: model))
			}
		}

		return sections
	}
}
