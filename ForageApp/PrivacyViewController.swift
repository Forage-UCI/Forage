//
//  PrivacyViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/1/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = "John Doe"
        emailLabel.text = "johndoe@gmail.com"
        phoneLabel.text = "(949)123-4567"
        // Do any additional setup after loading the view.
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
