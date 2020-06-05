//
//  ExploreViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import MapKit

class ExploreViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setInitialLocation()
        }
        mapView.delegate = self
    }
    
    @IBAction func didTapListButton(_ sender: Any) {
        guard let listResturantViewController = storyboard?.instantiateViewController(withIdentifier: "listRestaurantVC") as? ListRestaurantViewController else {return}
        present(listResturantViewController, animated: true)
        
    }
    
    /* ------ TODO: Set initial location after launching app */
    func setInitialLocation() {
       //UCI latitude and longitude
       let mapCenter = CLLocationCoordinate2D(latitude: 33.6405, longitude: -117.8443)

       //One degree of latitude is approximately 111 kilometers (69 miles) at all times.
       let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
       
       //Assign mapCenter and mapSan to region of mapView
       let region = MKCoordinateRegion(center: mapCenter, span: mapSpan)
       
       //set animated property to true to animate the transition to the region
       self.mapView.setRegion(region, animated: true)
       
    }
    
    func locationsPickedLocation(controller: LocationsViewController, latitude: NSNumber, longitude: NSNumber, title: String) {
        
        //locationField.text = title
        
        //dismiss teh LocationVC after adding the pin
        controller.dismiss(animated: true, completion: nil)
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
