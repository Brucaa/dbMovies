//
//  PopularMoviesViewController.swift
//  dbMovies
//
//  Created by Milos Jovanovic on 06/11/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit
import Kingfisher

protocol PrototypeCellReuseIdentifier {
    static var reusableCellIdentifier : String{get}
}

class PopularMoviesViewController: UIViewController, PrototypeCellReuseIdentifier {
    
    private var webService: Webservice!
    private var popularMovieListViewModel: PopularMovieListViewModel!
    static var reusableCellIdentifier: String {get {return "PopularMovieCell"} }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webService = Webservice()
        popularMovieListViewModel = PopularMovieListViewModel(webService: webService, completion: {
            
            self.tableView.reloadData()
        })
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - UITableViewDataSource
extension PopularMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.popularMovieListViewModel.popularMovieViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesViewController.reusableCellIdentifier, for: indexPath) as! PopularMoviesTableViewCell
        let popularMovie = popularMovieListViewModel.popularMovieAt(index: indexPath.row)
        cell.movieTitleLabel.text = popularMovie.movieTitle
        cell.movieRatingLabel.text = String(popularMovie.movieRating)
        cell.movieReleaseDate.text = popularMovie.movieReleaseDate
        
        let resource = ImageResource(downloadURL: URL(string: Constants.MOVIE_POSTER_PATH.rawValue+popularMovie.moviePosterImage)!, cacheKey: popularMovie.moviePosterImage)
        cell.moviePosterImage.kf.setImage(with: resource)
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension PopularMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}


// MARK: - UITableViewDataSourcePrefetching
extension PopularMoviesViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        self.popularMovieListViewModel.populatePopularMovies()
    }
    
}


// MARK: - MovieDetailsView configuration

extension PopularMoviesViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = storyBoard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let selectedMovie = popularMovieListViewModel.popularMovieAt(index: indexPath.row)
        
        DvC.getTitle = selectedMovie.movieTitle
        DvC.getPopularity = String(selectedMovie.moviePopularity)
        DvC.getReleaseDate = selectedMovie.movieReleaseDate
        DvC.getDescription = selectedMovie.movieOverview
        DvC.getImage = selectedMovie.moviePosterImage
        
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    
}
