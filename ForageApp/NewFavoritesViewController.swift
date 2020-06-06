//
//  NewFavoritesViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/5/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class NewFavoritesViewController: UIViewController {
    
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var reviewTextField: UITextView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    
    var venue: NSDictionary = [:]
    let CLIENT_ID = "QA1L0Z0ZNA2QVEEDHFPQWK0I5F1DE3GPLSNW4BZEBGJXUCFL"
    let CLIENT_SECRET = "W2AOE1TYC4MHK5SZYOUGX0J3LVRALMPB4CXT3ZH21ZCPUMCU"
    
    var restName: String!
    var formattedAddress: [String]!
    var placeID: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        var address: String = ""
        
        restaurantName.text = restName
        for str in formattedAddress{
            address = address + str + " "
        }
        
        addressLabel.text = address
        requestPlaceDetails()
        // Do any additional setup after loading the view.
    }
    
    func requestPlaceDetails(){
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
    
    func getPhotosFromVenue(){
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
            print(url)
            restaurantImageView.af.setImage(withURL: url)
        }
        
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
