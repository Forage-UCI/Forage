//
//  ListRestaurantTableViewCell.swift
//  Forage
//
//  Created by Ivy on 6/4/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class ListRestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
