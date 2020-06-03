//
//  FeedViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NavBarCheckInBtn: UIBarButtonItem!
    @IBOutlet weak var FeedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: implement cell count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedTableView.dequeueReusableCell(withIdentifier: "FeedRestaurantCell") as! FeedRestaurantCell
        // TODO: Setup FeedCell
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
