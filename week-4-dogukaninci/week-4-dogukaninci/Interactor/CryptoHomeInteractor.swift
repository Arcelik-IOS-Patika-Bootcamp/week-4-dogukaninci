//
//  CryptoInteractor.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//

import Foundation
class CryptoHomeInteractor: CryptoHome.Interactor {
    var presenter: CryptoHome.Presenter?
    
    var data: [Crypto]?
    
    func fetchData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            self.data = try! JSONDecoder().decode([Crypto].self, from: data)
            DispatchQueue.main.async {
                self.presenter?.didDataFetch()
            }
            
        }.resume()
    }
    
    
}
