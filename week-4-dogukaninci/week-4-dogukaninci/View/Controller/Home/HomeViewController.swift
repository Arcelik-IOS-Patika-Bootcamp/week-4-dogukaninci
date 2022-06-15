//
//  HomeViewController.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//

import UIKit

class HomeViewController: UIViewController, CryptoHome.View {
    
    var presenter: CryptoHome.Presenter?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cryptoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        searchBar.delegate = self
        
        cryptoTableView.register(UINib(nibName: "CryptoHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        presenter?.viewDidLoad()
        
    }
    func reloadView() {
        cryptoTableView.reloadData()
    }
    
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCryptoListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cryptoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CryptoHomeTableViewCell
        cell.cryptoNameLabel.text = presenter?.getCryptoListItem(indexPath: indexPath.row)?.name
        cell.cryptoSymbol.text = presenter?.getCryptoListItem(indexPath: indexPath.row)?.symbol?.uppercased()
        cell.currencyLabel.text = "$\(presenter?.getCryptoListItem(indexPath: indexPath.row)?.current_price! ?? 0)"
        cell.logoImageView.loadFrom(URLAddress: presenter?.getCryptoListItem(indexPath: indexPath.row)?.image ?? "")
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        return cell
    }
}
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        presenter?.getFilteredCryptoList(searchText: searchText)
        reloadView()
    }
}