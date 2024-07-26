//
//  GenericSectionView.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 05/07/24.
//

import SwiftUI

protocol GenericSectionView {
    var identifier: UUID { get set }

    func build() -> AnyView 
}
