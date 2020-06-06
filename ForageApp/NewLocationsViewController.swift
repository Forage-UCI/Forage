//
//  NewLocationsViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/5/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import CoreLocation

protocol NewLocationsViewControllerDelegate: class {
    func locationsPickedLocation(controller: NewLocationsViewController, latitude: NSNumber, longitude: NSNumber, title: String)
}

class NewLocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    weak var delegate: LocationsViewControllerDelegate!
       
       // ––––– TODO: Fill in actual CLIENT_ID and CLIENT_SECRET
       let CLIENT_ID = "QA1L0Z0ZNA2QVEEDHFPQWK0I5F1DE3GPLSNW4BZEBGJXUCFL"
       let CLIENT_SECRET = "W2AOE1TYC4MHK5SZYOUGX0J3LVRALMPB4CXT3ZH21ZCPUMCU"
    
    @IBOutlet weak var tableView: UITableView!
    //tableView
    @IBOutlet weak var searchBar: UISearchBar!
    //searchBar
    
    var results: NSArray = []
    
    var locationManager = CLLocationManager()
    var currentLoc: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        getCurrentLocation()
        fetchLocations(query: "temp")

        // Do any additional setup after loading the view.
    }
    
    func getCurrentLocation(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways {
            currentLoc = locationManager.location
            //print("lat: \(currentLoc.coordinate.latitude)  lng: \(currentLoc.coordinate.longitude)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewLocationCell") as! NewLocationCell
        
        cell.location = results[(indexPath as NSIndexPath).row] as? NSDictionary
        
        return cell
    }

    //What to do when cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // This is the selected venue
        let venue = results[(indexPath as NSIndexPath).row] as! NSDictionary
        
        /*-------TODO--------*/
        //Set the latitude and longitude of the venue and send it to the protocol
        //delegate.locationsPickedLocation(controller: self, latitude: lat, longitude: lng, title: name)
        
        // Return to the PhotoMapViewController with the lat and lng of venue
        
        self.performSegue(withIdentifier: "NewFavSegue", sender: tableView.cellForRow(at: indexPath))
        
    }

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = NSString(string: searchBar.text!).replacingCharacters(in: range, with: text)
        fetchLocations(query: newText)
        
        return true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchLocations(query: searchBar.text!)
    }

    func fetchLocations(query: String = "", near: String = "Irvine") {
        let baseUrlString = "https://api.foursquare.com/v2/venues/search?"
        
        let queryString = "client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20141020&near=\(near),CA&query=\(query)"
        //let queryString = "client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20141020&ll=\(currentLoc.coordinate.latitude),\(currentLoc.coordinate.longitude)&query=\(query)"

        let url = URL(string: baseUrlString + queryString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!
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
                            NSLog("response: \(responseDictionary)")
                        if responseDictionary != nil {
                            self.results = responseDictionary.value(forKeyPath: "response.venues") as! NSArray
                            self.tableView.reloadData()
                        }
                    }
                }
        });
        task.resume()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        //Do data processing
        let venue = results[(indexPath as NSIndexPath).row] as! NSDictionary
        
        if segue.identifier == "NewFavSegue"{
            let checkInViewController = segue.destination as! NewFavoritesViewController
            //print(venue)
            let name = venue.value(forKeyPath: "name") as! String
            let formattedAdress = venue.value(forKeyPath: "location.formattedAddress") as! [String]?
            let id = venue.value(forKey: "id") as! String
            checkInViewController.restName = name
            checkInViewController.formattedAddress = formattedAdress
            checkInViewController.placeID = id
        }
        tableView.deselectRow(at: indexPath, animated: true)
    //        self.dismiss(animated: true, completion: nil)
    }

}
