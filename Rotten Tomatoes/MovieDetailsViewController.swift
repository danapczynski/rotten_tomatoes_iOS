//
//  MovieDetailsViewController.swift
//  Rotten Tomatoes
//
//  Created by Daniel Apczynski on 2/5/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, UIScrollViewDelegate {

    var movie: NSDictionary!
    
    @IBOutlet weak var movieDetailsScrollView: UIScrollView!
    @IBOutlet weak var movieSynopsis: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var synopsisBackdrop: UIView!
    @IBOutlet weak var upArrow: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieStars: UILabel!
    @IBOutlet weak var movieTomato: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var posterUrl = movie.valueForKeyPath("posters.thumbnail") as String
        posterUrl = posterUrl.stringByReplacingOccurrencesOfString("_tmb", withString: "_ori")
        var score = movie.valueForKeyPath("ratings.critics_score") as Int
        var stars = movie["abridged_cast"] as [NSDictionary]
        var star1 = stars[0]["name"] as String
        var star2 = stars[1]["name"] as String
        
        self.title = (movie["title"] as? String)
        self.movieTitle.text = self.title
        self.movieSynopsis.text = (movie["synopsis"] as? String)
        self.movieSynopsis.sizeToFit()
        self.movieScore.text = "Critics rating: \(score)%"
        self.movieStars.text = "\(star1), \(star2)"
        self.synopsisBackdrop.frame.size.height += (self.movieSynopsis.frame.size.height + 50)
        self.moviePoster.setImageWithURL(NSURL(string: posterUrl))
        self.upArrow.image = UIImage(named: "up_arrow.png")
        self.movieTomato.image = UIImage(named: tomato(score))
        
        var height = (self.movieSynopsis.frame.size.height + 585)
        self.movieDetailsScrollView.contentSize = CGSizeMake(0, height)
    }
    
    func tomato(score: Int) -> String {
        if score > 59 { return "fresh.png" }
        else { return "rotten.png" }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
