//
//  WebService.swift
//  dbMovies
//
//  Created by Milos Jovanovic on 06/11/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadMovies(from pageNumber: Int, onCompletion: @escaping ([PopularMovie]) -> ()) {
        
        var popularMovies = [PopularMovie]()
        
        let popularMoviesURL = URL(string: Constants.POPULAR_MOVIES_BASE_URL.rawValue+"\(pageNumber)"+Constants.TMDB_API_KEY.rawValue)!
        
        
        let _ = URLSession.shared.dataTask(with: popularMoviesURL) { (data, response, error) in
            
            
            
            guard error == nil else {
                print("error while fetching the data: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let fetchedData = data else {
                print("NO Data received for the specified URL")
                return
            }
            
            guard let dictionary = try? JSONSerialization.jsonObject(with: fetchedData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any] else {
                
                print("Data error: \(fetchedData)")
                return
            }
            
            guard dictionary["status_code"] != nil else {
                MAX_PAGE = (dictionary["total_pages"] as! NSNumber).intValue
                let movieDictionary = dictionary["results"] as! [[String: Any]]
                if popularMovies.isEmpty {
                    popularMovies = movieDictionary.compactMap(PopularMovie.init)
                } else {
                    for movie in movieDictionary.compactMap(PopularMovie.init) {
                        popularMovies.append(movie)
                    }
                }
                
                
                DispatchQueue.main.async {
                    onCompletion(popularMovies)
                }
                
                return
            }
            }.resume()
    }
}
