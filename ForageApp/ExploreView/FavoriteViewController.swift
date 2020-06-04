//
//  FavoriteViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/3/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restuarantAddress: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onFavBtn(_ sender: Any) {
        favBtn.backgroundColor = UIColorFromRGB(rgbValue: 0xe20147)
        favBtn.setTitle("Favorited!", for: .normal)
        
        //TODO: add to favorite of posts
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
