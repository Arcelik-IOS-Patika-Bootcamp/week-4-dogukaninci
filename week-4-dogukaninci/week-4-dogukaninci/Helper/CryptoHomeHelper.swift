//
//  CryptoHomeHelper.swift
//  week-4-dogukaninci
//
//  Created by Doğukan Inci on 13.06.2022.
//

import Foundation
import UIKit

extension CryptoHome {
    
    /// Dependency Injection
    /// - Returns: UIViewController
    static func createModule() -> UIViewController? {
        let view = HomeViewController()
        let presenter = CryptoHomePresenter()
        let interactor = CryptoHomeInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
}
