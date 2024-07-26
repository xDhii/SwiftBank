//
//  BalanceSection.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 05/07/24.
//

import SwiftUI

struct BalanceSection: GenericSectionView {
    var identifier: UUID = UUID()
    
    var model: BalanceResponse

    func build() -> AnyView {
        return AnyView(BalanceView(balanceResponse: model))
    }
    

}
