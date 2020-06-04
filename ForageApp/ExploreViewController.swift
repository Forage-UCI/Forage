//
//  ExploreViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapListButton(_ sender: Any) {
        guard let listResturantViewController = storyboard?.instantiateViewController(withIdentifier: "listRestaurantVC") as? ListRestaurantViewController else {return}
        present(listResturantViewController, animated: true)
        
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
