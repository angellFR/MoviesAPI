//
//  ViewLoginRouter.swift
//  PeliculasNewTiss
//
//  Created Administrator on 12/04/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ViewLoginRouter {
    //MARK: - Protocol Properties
    weak var viewController: UIViewController?
    
    //MARK: - Static Methods
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ViewLoginViewController(nibName: nil, bundle: nil)
        let interactor = ViewLoginInteractor()
        let router = ViewLoginRouter()
        let presenter = ViewLoginPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

//MARK: - Router Metods
extension ViewLoginRouter: ViewLoginWireframeProtocol {
    func nextView() {
        let vc = HomeViewRouter.createModule()
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

//MARK: - Private functions
extension ViewLoginRouter {
    
}