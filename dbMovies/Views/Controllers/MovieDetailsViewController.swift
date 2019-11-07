//
//  MovieDetailsViewController.swift
//  dbMovies
//
//  Created by Milos Jovanovic on 06/11/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var getTitle = String()
    var getImage = String()
    var getReleaseDate = String()
    var getPopularity = String()
    var getDescription = String()
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text! = getTitle
        movieRelease.text! = getReleaseDate
        moviePopularity.text! = getPopularity
        movieDescription.text! = getDescription
        setImage()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setImage() {
        
        let url = URL(string: Constants.MOVIE_POSTER_PATH.rawValue+getImage)
        movieImage.kf.setImage(with: url)
    }


}
