//
//  HomeViewRouter.swift
//  PeliculasNewTiss
//
//  Created Administrator on 12/04/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewRouter {
    //MARK: - Protocol Properties
    weak var viewController: UIViewController?
    var detailRouter: MovieDetailRouter?
    
    //MARK: - Static Methods
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewViewController(nibName: nil, bundle: nil)
        let interactor = HomeViewInteractor()
        let router = HomeViewRouter()
        let presenter = HomeViewPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

//MARK: - Router Metods
extension HomeViewRouter: HomeViewWireframeProtocol {
    func singOff() {
        let vc = ProfileRouter.createModule()
        viewController?.present(vc, animated: true)
       
    }
    
      
    func showDetailMovie(dato: Int) {
        
        let vc = MovieDetailRouter.createModule(datos: dato)
        viewController?.navigationController?.pushViewController(vc, animated: true)
        print("Dato ya esta en el router ====== \(dato)")
    }
    

}

//MARK: - Private functions
extension HomeViewRouter {
    
}
