//
//  SectionModel.swift
//  SwiftBank
//
//  Created by Adriano Valumin on 25/06/24.
//

import Foundation

private enum CodingKeys: CodingKey {
    case id
    case type
    case content
}

enum SectionType: String, Decodable {
    case balance
    case creditCard = "credit_card"
    case genericSection = "generic_section"

}

struct SectionModel: Decodable {

    // MARK: - Attributes

    private(set) var id: String
    private(set) var type: SectionType
    private(set) var content: [String: Any]

    // MARK: - Init

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(SectionType.self, forKey: .type)
        self.content = try container.decode(DictionaryDecodable.self, forKey: .content).value as! [String: Any]
    }
}
