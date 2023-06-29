//
//  cellFavoritoCollectionView.swift
//  PeliculasNewTiss
//
//  Created by Administrator on 29/05/23.
//

import Foundation
import UIKit
import CoreData

class cellFavoriteCollectionView: UICollectionViewCell {
    static let identifier = "cellFavoriteCollectionView"
    
    private lazy var eliminarInfoCore: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.backgroundColor = UIColor(named: "FontGreen")
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(dismissProfile), for: .touchUpInside)
        return button
    }()
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 15, weight: .bold, width: .condensed)
        } else {
            // Fallback on earlier versions
        }
        
        return label
    }()
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        if #available(iOS 16.0, *) {
            label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
        } else {
            // Fallback on earlier versions
        }
        
        return label
    }()
    
    let movieFecha: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        return label
    }()
    
    let movieCalificacion: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = UIColor(named: "FontGreen")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "CellCollection")
        contentView.addSubview(movieName)
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieDescription)
        contentView.addSubview(movieFecha)
        contentView.addSubview(movieCalificacion)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        movieName.addAnchorsAndSize(width: nil, height: 20, left: 10, top: 2, right: 10, bottom: nil, withAnchor: .top, relativeToView: movieImageView)
        movieDescription.addAnchorsAndSize(width: width, height: nil, left: 10, top: 30, right: 10, bottom: 1, withAnchor: .top,relativeToView: movieName)
        movieImageView.addAnchorsAndSize(width: nil, height: 250, left: 0, top: 0, right: 0, bottom: nil)
        movieFecha.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 8, right: nil, bottom: nil, withAnchor: .top, relativeToView: movieName)
        movieCalificacion.addAnchorsAndSize(width: nil, height: nil, left: nil, top: 8, right: 8, bottom: nil, withAnchor: .top, relativeToView: movieName)
    }
    
//    func configure(model: MoviesFavorite){
//
//        movieName.text = model.titulo
//        movieDescription.text = model.descripcion
//        movieFecha.text = model.fecha
//        movieCalificacion.text = model.puntaje
//        let imageUrl = model.imagen
//
//        print("este es lo que trae model", model)
//        print("aqui esta la url de la imagen final::::: ",imageUrl)
//        print("aqui esta la nombre de la pelicula::::: ",movieName)
//        print("aqui esta la descripcion de la pelicula::::: ",movieDescription)
//        print("aqui esta la fecha de la pelicula::::: ",movieFecha)
//        print("aqui esta la calificacion::::: ",movieCalificacion)

//        guard let url = imageUrl { return }
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
    
//    }
    

