//
//  MovieCell.swift
//  Rotten Tomatoes
//
//  Created by Daniel Apczynski on 2/3/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tomatoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
