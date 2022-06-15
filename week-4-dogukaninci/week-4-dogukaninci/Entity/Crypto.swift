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
    let price_change_percentage_24h: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case current_price
        case price_change_percentage_24h
    }
}
