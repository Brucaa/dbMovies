//
//  Constants.swift
//  dbMovies
//
//  Created by Milos Jovanovic on 06/11/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import Foundation

enum Constants: String {
    
    case POPULAR_MOVIES_BASE_URL = "https://api.themoviedb.org/3/movie/popular?page="
    case TMDB_API_KEY = "&language=en-US&api_key=8b91c6a6651182b13692c21b0ed29082"
    case MOVIE_POSTER_PATH = "https://image.tmdb.org/t/p/w500/"
}

var MAX_PAGE = 1
