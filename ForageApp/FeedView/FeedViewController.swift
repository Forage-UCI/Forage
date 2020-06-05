//
//  FeedViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Last modified by Yanjie Xu on 6/03/20
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NavBarCheckInBtn: UIBarButtonItem!
    @IBOutlet weak var FeedTableView: UITableView!
    
    var viewModels = [RestaurantListViewModel]() {
        didSet {
            FeedTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        
        print(viewModels)
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: implement cell count
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedTableView.dequeueReusableCell(withIdentifier: "FeedRestaurantCell") as! FeedRestaurantCell
        
        //rounded rectangle
        cell.restaurantImageView.layer.cornerRadius = 5;
        cell.restaurantImageView.layer.masksToBounds = true;
        // TODO: Setup FeedCell
        let vm = viewModels[indexPath.row]
        cell.configure(with: vm)
        
        return cell
    }

    @IBAction func onTapCheckIn(_ sender: Any) {
        self.performSegue(withIdentifier: "LocationsViewController", sender: nil)
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
