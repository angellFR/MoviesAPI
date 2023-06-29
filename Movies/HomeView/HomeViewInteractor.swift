//
//  HomeViewInteractor.swift
//  PeliculasNewTiss
//
//  Created Administrator on 12/04/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewInteractor: NSObject, URLSessionDelegate,URLSessionDataDelegate {
    //MARK: - Protocol Properties
    weak var presenter: HomeViewPresenterProtocol?
    private var dataTask : URLSessionDataTask?
        private var responseData : Data = Data()
        private var httpResponse : HTTPURLResponse?
  
    override init() {
        super.init()
    }
  
}

//MARK: - Interactor Methods
extension HomeViewInteractor: HomeViewInteractorProtocol {

    
    
    func getInitData(moviType: MoviesType){
            
            let urlString = (ConstantesPelis.BASE_URL + moviType.rawValue + ConstantesPelis.API_KEY)
            guard let url = URL(string: urlString) else {return}
            var  request = URLRequest(url: url)
            request.timeoutInterval = 90
            request.httpMethod = "GET"
            
            let sessionConfoguration = URLSessionConfiguration.default
            let defaultSession = URLSession(configuration: sessionConfoguration, delegate: self, delegateQueue: OperationQueue.main)
            
            dataTask = defaultSession.dataTask(with: request)
            dataTask?.resume()
            responseData = Data()
        }
    
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
            if error == nil{
                if httpResponse?.statusCode == 200{
                    let response = String(data: responseData, encoding: String.Encoding.utf8)
                    if let _ = response{
                        do{
                            let responseLogin = try
                            JSONDecoder().decode(Movies.self, from: responseData)
                            print("Respuesta Ok>>>>::::\(responseLogin)")
                            presenter?.info(peli: responseLogin)
                            
                        }catch{
                            print("Error creando objetos \(error)")
                            
                        }
                    }else{
                        print("Error en crear string\(String(describing: error))")
                        
                    }
                    
                }else{
                    print("http diferente de 200\(String(describing: error))")
                    
                }
            }else{
                print("El error no fue nil\(String(describing: error))")
              
            }
        }
        
        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
            responseData.append(data)
        }
      
        func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
            httpResponse = response as? HTTPURLResponse
            completionHandler(URLSession.ResponseDisposition.allow)
        }
}
