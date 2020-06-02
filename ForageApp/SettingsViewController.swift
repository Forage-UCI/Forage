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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = PFUser.current()?.username
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
