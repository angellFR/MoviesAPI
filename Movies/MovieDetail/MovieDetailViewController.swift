//
//  MovieDetailViewController.swift
//  PeliculasNewTiss
//
//  Created Administrator on 08/05/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import CoreData

class MovieDetailViewController: UIViewController {

    //MARK: - Protocol Properties
	var presenter: MovieDetailPresenterProtocol?

    //MARK: - Properties
    var idPelicula = Int()
    var datoPelicula: detailMovie?
//    Segundo Paso: Referencia al managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let movieFavorite = [MoviesFavorite]()
    var buttonContador = 0
 
    lazy var scrollDetail: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)
        scrollView.addAnchors(left: 0, top: 0, right: 0, bottom: 25)
        return scrollView
    }()
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    var movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 30, weight: .bold, width: .condensed)
        } else {
            // Fallback on earlier versions
        }
      
//        label.text = "aqui va el nombre de la pelicula"
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 50
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 15, weight: .light, width: .condensed)
        } else {
            // Fallback on earlier versions
        }
//        label.text = "Aqui va a ir la descripcion de la pelicula ::::::::::::::::::::::::: "
        return label
    }()
    
    let movieDate: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.numberOfLines = 1
//        label.text = "Aqui va a ir la descripcion de la pelicula ::::::::::::::::::::::::: "
        return label
    }()
    
    let moviePoint: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.numberOfLines = 50
//        label.text = "Aqui va a ir la descripcion de la pelicula ::::::::::::::::::::::::: "
        return label
    }()
    
    let movieGenere: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.numberOfLines = 1
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 15, weight: .medium, width: .condensed)
        } else {
            // Fallback on earlier versions
        }
//        label.text = "Aqui va a ir la descripcion de la pelicula ::::::::::::::::::::::::: "
        return label
    }()
    
    let addFavorite: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(named: "FontGreen")
        button.setTitle("+", for: .normal)
        return button
    }()
    
    //MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        presenter?.getInitData(dato: idPelicula)
       
    }
    
    //MARK: - Methods
    func setupView() {
        var buttonFav = UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .done, target: self, action: #selector(favorite))
        navigationItem.rightBarButtonItem = buttonFav
       
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .done, target: self, action: #selector(favorite))
        navigationController?.navigationBar.tintColor = .white
//        view.addSubview(scrollDetail)
        scrollDetail.addSubview(movieName)
        scrollDetail.addSubview(movieDescription)
        scrollDetail.addSubview(movieImage)
        scrollDetail.addSubview(movieDate)
//        scrollDetail.addSubview(moviePoint)
        scrollDetail.addSubview(movieGenere)
        
        movieImage.addAnchorsAndCenter(centerX: true, centerY: false, width: 250, height: 350, left: nil, top: 10, right: nil, bottom: nil)
        movieName.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 15, right: 10, bottom: nil, withAnchor: .top, relativeToView: movieImage)
        movieDescription.addAnchorsAndSize(width: width-15, height: nil, left: 10, top: 20, right: nil, bottom: 0, withAnchor: .top, relativeToView: movieDate)
        movieDate.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 5, right: nil, bottom: nil,withAnchor: .top,relativeToView: movieGenere)
        movieGenere.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 5, right: nil, bottom: nil, withAnchor: .top,relativeToView: movieName)
        
    }
    
    func info(peli: detailMovie) {
       datoPelicula = peli
        print("detalles de la pelicula:::: ", datoPelicula)
        movieName.text = datoPelicula?.title
        movieDescription.text = datoPelicula?.overview
        movieDate.text = datoPelicula?.releaseDate
        moviePoint.text = datoPelicula?.voteAverage.description
        movieGenere.text = datoPelicula?.originalTitle
        
        guard let urlImage = datoPelicula?.backdropPath else {return}
        
        if let urlString = ("https://image.tmdb.org/t/p/w200\(urlImage)") as? String {
            print("url de la imagen \(urlString)")
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else{
                        return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        self.movieImage.image = image
                    }
                }
            }
        }
        
        
    }

}

//MARK: - View Methods
extension MovieDetailViewController: MovieDetailViewProtocol {
    
    func configure(dato: detailMovie){
        
        movieName.text = dato.title
        movieDescription.text = dato.overview
        print("aqui esta model id ::::::::::::::::")
        
//        let url = URL(string: "https://image.tmdb.org/t/p/w200" + datoPelicula.)!
//        if let data = try? Data(contentsOf: url) {
//            DispatchQueue.main.async {
//
//                //imageCache.setObject(image, forKey: urlS as NSString)
//
//                self.movieImageView.image = UIImage(data: data)
//
//            }
//
//
//        }

    }

}

//MARK: - Private functions
extension MovieDetailViewController {
    
   @objc func favorite(){
       let nameFavorite = MoviesFavorite(context: self.context)
       nameFavorite.titulo = movieName.text
       let descriptionFavorite = MoviesFavorite(context: self.context)
       descriptionFavorite.descripcion = movieDescription.text
       let moviImagenn = MoviesFavorite(context: self.context)
       moviImagenn.imagen = movieImage.description
       
       guardar()
        
//       if buttonContador == 0 {
//           self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart.fill"), style: .done, target: self, action: #selector(favorite))
//           buttonContador = 1
//     
//           
//           print("se anadio a favorito")
//       } else {
//           self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .done, target: self, action: #selector(favorite))
//           buttonContador = 0
//           print("se borro de favorito")
//       }
//       
    }
    func guardar(){
        do {
            try context.save()
        }catch {
            print(error.localizedDescription)
        }
//        self.movieFavorite.reloadData()
    }
}