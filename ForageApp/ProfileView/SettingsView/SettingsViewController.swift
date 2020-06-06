//
//  SettingsViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/1/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2

        // Do any additional setup after loading the view.
        usernameLabel.text = PFUser.current()?.username
        callView.isHidden = true
        callView.layer.cornerRadius = 10;
        callView.layer.masksToBounds = true;
        callView.layer.borderWidth = 1
        callView.layer.borderColor = UIColor.orange.cgColor
        
        tableView.separatorStyle = .none
    }
    
    @IBAction func onEditProfileButton(_ sender: Any) {
               let picker = UIImagePickerController()
               picker.delegate = self
               picker.allowsEditing = true
               
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   picker.sourceType = .camera
               } else{
                   picker.sourceType = .photoLibrary
               }
               
               present(picker, animated: true, completion: nil)
    }
           
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               let image = info[.editedImage] as! UIImage
               
               let size = CGSize(width: 75, height: 75)
               let scaledImage = image.af_imageScaled(to: size)
               
               profileImageView.image = scaledImage
               
           
               dismiss(animated: true, completion: nil)
               
    }
    
    @IBAction func onContactBtn(_ sender: Any) {
        callView.isHidden = false
    }
    
    @IBAction func onCancelBtn(_ sender: Any) {
        callView.isHidden = true
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

//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//
//}
