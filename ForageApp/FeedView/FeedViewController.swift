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
    
    
    var venue: NSDictionary = [:]
    let CLIENT_ID = "QA1L0Z0ZNA2QVEEDHFPQWK0I5F1DE3GPLSNW4BZEBGJXUCFL"
    let CLIENT_SECRET = "W2AOE1TYC4MHK5SZYOUGX0J3LVRALMPB4CXT3ZH21ZCPUMCU"
    
    
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
    
    func loadData(){
//        var address: String = ""
//        RestNameLable.text = restName
//        for str in formattedAddress{
//            address = address + str + " "
//        }
//        AddressLabel.text = address
        requestPlaceDetails()
        
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
        cell.restaurantImageView.af_setImage(withURL: URL(string: images[indexPath.row])!)
//        let url = self.getPhotosFromVenue()
//        cell.restaurantImageView.af.setImage(withURL: url)
//        let vm = viewModels[indexPath.row]
//        cell.configure(with: vm)
        
        return cell
    }

    @IBAction func onTapCheckIn(_ sender: Any) {
        self.performSegue(withIdentifier: "LocationsViewController", sender: nil)
    }
    
    func requestPlaceDetails() {
        let baseUrlString = "https://api.foursquare.com/v2/venues/"
        let queryString = "\(placeID!)?&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20141020"
        let url = URL(string: baseUrlString + queryString)!
        let request = URLRequest(url: url)

        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! JSONSerialization.jsonObject(
                        with: data, options:[]) as? NSDictionary {
                            //NSLog("response: \(responseDictionary)")
                        self.venue = responseDictionary.value(forKeyPath: "response.venue") as! NSDictionary
                        print(self.venue)
                        //You can add other function like getPhotos to get more detail place infos
                        self.getPhotosFromVenue()
                    }
                }
        });
        task.resume()
    }
    
    func getPhotosFromVenue() -> URL{
        let photos_count = venue.value(forKeyPath: "photos.count") as! Int
        if photos_count > 0{
            let photos_groups = venue.value(forKeyPath: "photos.groups") as! NSArray
            let photos = (photos_groups[0] as AnyObject).value(forKey: "items") as! NSArray
            let photo = photos[0] as! NSDictionary
            let prefix = photo.value(forKey: "prefix") as! String
            let suffix = photo.value(forKey: "suffix") as! String
            print(prefix)
            print(suffix)
            let url = URL(string: prefix+"500x300"+suffix)!
            return url
//            .af.setImage(withURL: url)
        }
        
        return URL(string: "")!
        
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
