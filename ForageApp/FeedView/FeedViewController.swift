//
//  FeedViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Last modified by Yanjie Xu on 6/03/20
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NavBarCheckInBtn: UIBarButtonItem!
    @IBOutlet weak var FeedTableView: UITableView!
    
    
    var venue: NSDictionary = [:]
    let CLIENT_ID = "QA1L0Z0ZNA2QVEEDHFPQWK0I5F1DE3GPLSNW4BZEBGJXUCFL"
    let CLIENT_SECRET = "W2AOE1TYC4MHK5SZYOUGX0J3LVRALMPB4CXT3ZH21ZCPUMCU"
    
    //var favorite_rest = [PFObject()]
    
    
    var viewModels = [RestaurantListViewModel]() {
        didSet {
            FeedTableView.reloadData()
        }
    }
    
    
    var restName: String!
    var formattedAddress: [String]!
    var placeID: String!
    
    var favorites = ["McDonalds", "Chick-Fil-A", "In-N-Out"]
    var distances = ["1.3", "0.1", "0.2"]
    var addresses = ["5445 Alton Pkwy, Irvine, CA 92614", "4127 Campus Dr, Irvine, CA 92612", "4115 Campus Dr, Irvine, CA 92612"]
    var images = ["https://i0.wp.com/www.eatthis.com/wp-content/uploads/2018/12/mcdonalds-drive-through-restaurant.jpg?fit=1200%2C879&ssl=1", "https://cdn.vox-cdn.com/thumbor/_yP_AQ6o1VKKfy1uaiPrvoU1vBo=/0x0:800x600/1200x800/filters:focal(0x0:800x600)/cdn.vox-cdn.com/uploads/chorus_image/image/48611049/Restaurant_Chick-Fil-A_in_Sugar_House_SLC.0.0.JPG", "https://3u8dbs16f2emlqxkbc8tbvgf-wpengine.netdna-ssl.com/wp-content/uploads/2018/11/innout-1.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedTableView.dataSource = self
        FeedTableView.delegate = self
        //loadData() // when to request?
        print(viewModels)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let query = PFQuery(className: "Fav_Restaurands")
//        query.includeKey("author")
//        query.limit = 20
//
//        query.findObjectsInBackground { (favorites, error) in
//            if favorites != nil {
//                self.favorite_rest = favorites!
//                //var count = 0
////                for fav in self.favorite_rest{
////                    let user = fav["author"] as! PFUser
////                }
////                self.postNumberLabel.text = String(count)
//                print(self.favorite_rest)
//            } else{
//                print("error!")
//            }
//        }
    }
    
    func loadData(){
//        var address: String = ""
//        RestNameLable.text = restName
//        for str in formattedAddress{
//            address = address + str + " "
//        }
//        AddressLabel.text = address
        //requestPlaceDetails()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: implement cell count
        //return viewModels.count
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedTableView.dequeueReusableCell(withIdentifier: "FeedRestaurantCell") as! FeedRestaurantCell
        
        //rounded rectangle
        cell.restaurantImageView.layer.cornerRadius = 5;
        cell.restaurantImageView.layer.masksToBounds = true;
        // TODO: Setup FeedCell
        cell.restaurantNameLabel.text = favorites[indexPath.row]
        cell.distanceLabel.text = distances[indexPath.row]
        cell.addressLabel.text = addresses[indexPath.row]
        cell.restaurantImageView.af_setImage(withURL: URL(string: images[indexPath.row])!)
//        let url = self.getPhotosFromVenue()
//        cell.restaurantImageView.af.setImage(withURL: url)
//        let vm = viewModels[indexPath.row]
//        cell.configure(with: vm)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "CheckInFeedViewController") as? CheckInFeedViewController
        vc?.address = addresses[indexPath.row]
        vc?.restName = favorites[indexPath.row]
        vc?.imageURL = images[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
        /*-------TODO--------*/
        //Set the latitude and longitude of the venue and send it to the protocol
        //delegate.locationsPickedLocation(controller: self, latitude: lat, longitude: lng, title: name)
        
        // Return to the PhotoMapViewController with the lat and lng of venue
        
//        self.performSegue(withIdentifier: "FeedCheckInSegue", sender: tableView.cellForRow(at: indexPath))
    }

    @IBAction func onTapCheckIn(_ sender: Any) {
        self.performSegue(withIdentifier: "LocationsViewController", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        //Do data processing
//        let venue = results[(indexPath as NSIndexPath).row] as! NSDictionary
        
        if segue.identifier == "FeedCheckInSegue"{
            let checkInViewController = segue.destination as! CheckInFeedViewController
//            print("IN FEED VIEW")
//            print(venue)
//            let name = venue.value(forKeyPath: "name") as! String
//            let formattedAdress = venue.value(forKeyPath: "location.formattedAddress") as! [String]?
//            let id = venue.value(forKey: "id") as! String
//            checkInViewController.restName =
//            checkInViewController.formattedAddress = formattedAdress
//            checkInViewController.placeID = id
        }
//        tableView.deselectRow(at: indexPath, animated: true)
//        self.dismiss(animated: true, completion: nil)
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
