//
//  ConstantesPelis.swift
//  PeliculasNewTiss
//
//  Created by Administrator on 12/04/23.
//


struct ConstantesPelis {
    static let API_KEY = "?api_key=281898d72ea15fc404af005d189f3e9a&language=es-ES&page=1"
    static let BASE_URL = "https://api.themoviedb.org/3/movie/"
    static let IMAGES_BASE_URL = "https://image.tmdb.org/t/p/"
    static let BACK_DROP_BASE_URL = IMAGES_BASE_URL + "w500"
    static let POSTER_BASE_URL = IMAGES_BASE_URL + "w185"
    static let API_TOKEN = "https://api.themoviedb.org/3/authentication/token/new?api_key=281898d72ea15fc404af005d189f3e9a"
    static let API_LOGIN = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=281898d72ea15fc404af005d189f3e9a"
}

enum MoviesType: String {
    case popular = "popular"
    case upcoming = "upcoming"
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
}
