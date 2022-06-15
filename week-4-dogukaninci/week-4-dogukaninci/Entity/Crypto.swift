//
//  Model.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//

struct Crypto: Decodable {
    let id: String?
    let symbol: String?
    let name: String?
    let image: String?
    let current_price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case current_price
    }
}
