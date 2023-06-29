//
//  HomeViewProtocols.swift
//  PeliculasNewTiss
//
//  Created Administrator on 12/04/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeViewWireframeProtocol: AnyObject {
    func showDetailMovie(dato: Int)
    func singOff()
}
//MARK: Presenter -
protocol HomeViewPresenterProtocol: AnyObject {
    
    func getData(moviType: MoviesType)
    func info(peli: Movies)
    func detailPeli(dato: Int)
    func singOff()

}

//MARK: Interactor -
protocol HomeViewInteractorProtocol: AnyObject {

  var presenter: HomeViewPresenterProtocol?  { get set }
    func getInitData(moviType: MoviesType) // conexion interactor ----> presenter
}

//MARK: View -
protocol HomeViewViewProtocol: AnyObject {

  var presenter: HomeViewPresenterProtocol?  { get set }
    func info(peli: Movies) //conexion presenter ---> view
}
