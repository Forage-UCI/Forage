//
//  ListRestaurantViewController.swift
//  Forage
//
//  Created by Ivy on 6/4/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ListRestaurantViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var restaurantNames = ["Mcdonald's", "Chick-fil-A", "In-N-Out"]
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension ListRestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreRestaurantCell", for: indexPath) as! ExploreRestaurantCell
        cell.restaurantName.text = restaurantNames[indexPath.row]
        cell.numFavFriendsLabel.text = String(Int.random(in: 1...45)) //dummy data for number of friends liking it 

        let PlaceAPIKey = "AIzaSyCiazPfD9GV3Tz0jOjTH3WCSQsKqNMMUBM"
        //"https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=CnRtAAAATLZNl354RwP_9UKbQ_5Psy40texXePv4oAlgP4qNEkdIrkyse7rPXYGd9D_Uj1rVsQdWT4oRz4QrYAJNpFX7rzqqMlZw2h2E2y5IKMUZ7ouD_SlcHxYq1yL4KbKUv3qtWgTK0A6QbGh87GB3sscrHRIQiG2RrmU_jF4tENr9wGS_YxoUSSDrYjWmrNfeEHSGSc3FyhNLlBU&key=AIzaSyCiazPfD9GV3Tz0jOjTH3WCSQsKqNMMUBM"
        
        
        AF.request("https://httpbin.org/image/png").responseImage { response in
            
            if case .success(let image) = response.result {
                cell.restaurantImage.image = image
                
            }
        }
        return cell
    }
    
    
}
