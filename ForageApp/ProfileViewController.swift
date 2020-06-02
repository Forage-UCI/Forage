//
//  ProfileViewController.swift
//  Forage
//
//  Created by Maha Malik on 5/26/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var visitedPlacesLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //circular profile image
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        username.text = PFUser.current()?.username
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        //switch user back to login screen
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewContoller = main.instantiateViewController(withIdentifier: "loginViewController")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let delegate =  windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginViewContoller
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
