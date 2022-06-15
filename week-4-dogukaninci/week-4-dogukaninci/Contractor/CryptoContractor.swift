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
    
    /// Informs that the fetching data is over
    func didDataFetch()
    
    /// Get Crypto array count
    /// - Returns: Int
    func getCryptoListCount() -> Int?
    
    /// Get spesific item for table view cell
    /// - Parameter indexPath: table view indexPath.row
    /// - Returns: Spesific Crypto model
    func getCryptoListItem(indexPath: Int) -> Crypto?
    
    /// Filtering Crypto data list by search bar
    /// - Parameter searchText: Search Bar Text
    func getFilteredCryptoList(searchText: String)
}

protocol CryptoHomeInteractorProtocol: AnyObject {
    var presenter: CryptoHome.Presenter? { get set }
    
    var data: [Crypto]? { get }
    
    /// Fething data
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
