//
//  FeedViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Last modified by Yanjie Xu on 6/03/20
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NavBarCheckInBtn: UIBarButtonItem!
    @IBOutlet weak var FeedTableView: UITableView!
    
    var placesClient: GMSPlacesClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        
        // Do any additional setup after loading the view.
        placesClient = GMSPlacesClient.shared()
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) | UInt(GMSPlaceField.placeID.rawValue))!
        
        //TEST ONLY: print current locations
        placesClient?.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: fields, callback: {
          (placeLikelihoodList: Array<GMSPlaceLikelihood>?, error: Error?) in
          if let error = error {
            print("An error occurred: \(error.localizedDescription)")
            return
          }

          if let placeLikelihoodList = placeLikelihoodList {
            for likelihood in placeLikelihoodList {
              let place = likelihood.place
              print("Current Place name \(String(describing: place.name)) at likelihood \(likelihood.likelihood)")
              print("Current PlaceID \(String(describing: place.placeID))")
            }
          }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: implement cell count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedTableView.dequeueReusableCell(withIdentifier: "FeedRestaurantCell") as! FeedRestaurantCell
        
        //rounded rectangle
        cell.restaurantImageView.layer.cornerRadius = 5;
        cell.restaurantImageView.layer.masksToBounds = true;
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
