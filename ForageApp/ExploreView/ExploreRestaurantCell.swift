//
//  ExploreRestaurantCell.swift
//  Forage
//
//  Created by Maha Malik on 6/4/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class ExploreRestaurantCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var numFavFriendsLabel: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
