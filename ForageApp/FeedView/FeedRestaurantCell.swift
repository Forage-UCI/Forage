//
//  FeedRestaurantCell.swift
//  Forage
//
//  Created by Maha Malik on 6/1/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class FeedRestaurantCell: UITableViewCell {
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
