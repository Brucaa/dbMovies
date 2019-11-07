//
//  PopularMovie.swift
//  dbMovies
//
//  Created by Milos Jovanovic on 06/11/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import Foundation

class PopularMovie {
    
    var movieTitle: String!
    var moviePopularity: Double!
    var movieRating: Float!
    var movieOverview: String!
    var movieReleaseDate: String!
    var moviePosterImage: String!
    
    init(movieTitle: String,moviePopularity: Double, movieRating: Float, movieOverview: String, movieReleaseDate: String, moviePosterImage: String) {
        self.movieTitle = movieTitle
        self.moviePopularity = moviePopularity
        self.movieRating = movieRating
        self.movieOverview = movieOverview
        self.movieReleaseDate = movieReleaseDate
        self.moviePosterImage = moviePosterImage
    }
    
    init?(dictionary: [String: Any]) {
        
        guard let movieTitle = dictionary["title"] as? String,
            let moviePopularity = dictionary["popularity"] as? NSNumber,
            let movieRating = dictionary["vote_average"] as? NSNumber,
            let movieOverview = dictionary["overview"] as? String,
            let movieReleaseDate = dictionary["release_date"] as? String,
            let moviePosterImage = dictionary["poster_path"] as? String else {
                return nil
        }
        
        self.movieTitle = movieTitle
        self.moviePopularity = moviePopularity.doubleValue
        self.movieRating = movieRating.floatValue
        self.movieOverview = movieOverview
        self.movieReleaseDate = movieReleaseDate
        self.moviePosterImage = moviePosterImage
    }
    
}
