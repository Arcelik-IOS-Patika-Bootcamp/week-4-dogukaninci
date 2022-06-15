//
//  CryptoPresenter.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//

import Foundation

class CryptoHomePresenter: CryptoHome.Presenter {
    var filteredData: [Crypto]?
    
    var view: CryptoHome.View?
    
    var interactor: CryptoHome.Interactor!
    
    var router: CryptoHome.Router!
    
    /// Fetch data using interactor layer
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    /// Reload table view
    func didDataFetch() {
        guard let data = interactor.data else { return }
        filteredData = data
        view?.reloadView()
    }
    /// Get Crypto array count
    /// - Returns: Int
    func getCryptoListCount() -> Int? {
        return filteredData?.count
    }
    
    /// Return specific item using indexPath
    /// - Parameter indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    func getCryptoListItem(indexPath: Int) -> Crypto? {
        return filteredData?[indexPath]
    }
    
    /// Make filter to Crypto array,using search bar text
    /// - Parameter searchText: <#searchText description#>
    func getFilteredCryptoList(searchText: String) {
        guard let data = interactor.data else { return }
        if(searchText == "") {
            filteredData = data
        } else {
            filteredData = data.filter {
                $0.name!.lowercased().contains(searchText.lowercased())
            }
        }
        
    }
    
    
}

