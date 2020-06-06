//
//  ListRestViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/4/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class ListRestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var restaurantNames = ["Mcdonald's", "Chick-fil-A", "In-N-Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreRestaurantCell", for: indexPath) as! ExploreRestaurantCell
        cell.restaurantName.text = restaurantNames[indexPath.row]
        cell.numFavFriendsLabel.text = String(Int.random(in: 1...45))
        
        return cell
    }
    @IBAction func onTouchDown(_ sender: Any) {
        self.performSegue(withIdentifier: "favoriteSegue", sender: nil)
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
