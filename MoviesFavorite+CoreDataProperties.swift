//
//  MoviesFavorite+CoreDataProperties.swift
//  PeliculasNewTiss
//
//  Created by Administrator on 25/05/23.
//
//

import Foundation
import CoreData


extension MoviesFavorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesFavorite> {
        return NSFetchRequest<MoviesFavorite>(entityName: "MoviesFavorite")
    }

    @NSManaged public var titulo: String?
    @NSManaged public var fecha: String?
    @NSManaged public var imagen: String?
    @NSManaged public var descripcion: String?
    @NSManaged public var puntaje: String?

}

extension MoviesFavorite : Identifiable {

}
