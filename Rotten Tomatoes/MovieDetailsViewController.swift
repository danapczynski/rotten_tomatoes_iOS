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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var posterUrl = movie.valueForKeyPath("posters.thumbnail") as String
        posterUrl = posterUrl.stringByReplacingOccurrencesOfString("_tmb", withString: "_ori")
        
        self.title = (movie["title"] as? String)
        
        self.movieSynopsis.text = (movie["synopsis"] as? String)
        self.movieSynopsis.sizeToFit()
        self.synopsisBackdrop.frame.size.height = self.movieSynopsis.frame.size.height + 50
        self.moviePoster.setImageWithURL(NSURL(string: posterUrl))
        
        var height = (self.movieSynopsis.frame.size.height + 585)
        self.movieDetailsScrollView.contentSize = CGSizeMake(0, height)
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
