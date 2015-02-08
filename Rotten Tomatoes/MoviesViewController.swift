//
//  MoviesViewController.swift
//  Rotten Tomatoes
//
//  Created by Daniel Apczynski on 2/3/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSDictionary]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movies"
        tableView.dataSource = self
        tableView.delegate = self
        
        var url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=30&country=us&apikey=dagqdghwaq3e3mxyrp7kmmj5")
        var request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
            
            self.movies = responseDictionary["movies"] as [NSDictionary]
            self.tableView.reloadData()
            
//            NSLog("Response %@", responseDictionary)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        var movie = movies[indexPath.row]
        var posterUrl = movie.valueForKeyPath("posters.thumbnail") as String
        var score = movie.valueForKeyPath("ratings.critics_score") as Int
        
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        cell.scoreLabel.text =  "\(score)%"
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var vc = segue.destinationViewController as MovieDetailsViewController
        var indexPath = tableView.indexPathForCell(sender as UITableViewCell)
        vc.movie = movies[indexPath!.row] as NSDictionary!
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
