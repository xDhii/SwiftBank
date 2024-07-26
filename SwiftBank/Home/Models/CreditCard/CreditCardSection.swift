//
//  CreditCardSection.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 10/07/24.
//

import SwiftUI

struct CreditCardSection: GenericSectionView {
	var identifier: UUID = UUID()
	var model: CreditCardResponse

	func build() -> AnyView {
		return AnyView(CreditCardView(creditCardResponse: model))
	}


}
