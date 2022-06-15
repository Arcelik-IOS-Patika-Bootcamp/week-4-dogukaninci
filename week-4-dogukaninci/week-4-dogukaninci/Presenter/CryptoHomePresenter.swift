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
    
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    func didDataFetch() {
        guard let data = interactor.data else { return }
        filteredData = data
        view?.reloadView()
    }
    func getCryptoListCount() -> Int? {
        return filteredData?.count
    }
    
    func getCryptoListItem(indexPath: Int) -> Crypto? {
        return filteredData?[indexPath]
    }
    
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

