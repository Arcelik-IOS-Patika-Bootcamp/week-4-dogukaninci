//
//  CryptoContractor.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//


protocol CryptoHomeViewProtocol: AnyObject {
    var presenter: CryptoHome.Presenter? { get set }
    func reloadView()
}

protocol CryptoHomePresenterProtocol: AnyObject {
    var view: CryptoHome.View? { get set }
    var interactor: CryptoHome.Interactor! { get set }
    var router: CryptoHome.Router! { get set }
    
    var filteredData: [Crypto]? { get set }
    
    func viewDidLoad()
    
    func didDataFetch()
    
    func getCryptoListCount() -> Int?
    
    func getCryptoListItem(indexPath: Int) -> Crypto?
    
    func getFilteredCryptoList(searchText: String)
}

protocol CryptoHomeInteractorProtocol: AnyObject {
    var presenter: CryptoHome.Presenter? { get set }
    
    var data: [Crypto]? { get }
    
    func fetchData()
}

protocol CryptoHomeEntityProtocol: AnyObject {
    
}
protocol CryptoHomeRouterProtocol: AnyObject {
    var presenter: CryptoHome.Presenter? { get set }
    //func navigateToDetail(with customObject: Object)
}

struct CryptoHome {
    typealias View = CryptoHomeViewProtocol
    typealias Interactor = CryptoHomeInteractorProtocol
    typealias Presenter = CryptoHomePresenterProtocol
    typealias Entity = CryptoHomeEntityProtocol
    typealias Router = CryptoHomeRouterProtocol
}
