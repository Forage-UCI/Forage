//
//  CheckInViewController.swift
//  Forage
//
//  Created by Yanjie Xu on 2020/6/3.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit
import Parse
class CheckInViewController: UIViewController  {

    @IBOutlet weak var RestNameLable: UILabel!
    @IBOutlet weak var RestPhotoView: UIImageView!
    @IBOutlet weak var ReviewTextField: UITextView!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var CheckInBtn: UIButton!
    
    var restName: String!
    var formattedAddress: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var address: String = ""
        
        RestNameLable.text = restName
        for str in formattedAddress{
            address = address + str + " "
        }
        
        AddressLabel.text = address
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCheckInBtn(_ sender: Any) {
        let post = PFObject(className: "Fav_Restaurands")
        
        post["name"] = RestNameLable.text
        post["address"] = formattedAddress
        post["user"] = PFUser.current()
        CheckInBtn.backgroundColor = UIColorFromRGB(rgbValue: 0x63c522)
        CheckInBtn.setTitle("Checked-In!", for: .normal)
        
        //TODO: link restaurand id with user: user should have column that contains list of fav restaurands
        //if post[freq] != 0:
        // post[freq]++
        // save posts
        
        
        post.saveInBackground { (success, error) in
            if success{
                print(post.objectId)
                self.dismiss(animated: true, completion: nil)
                print("Saved Post")
            }else{
                print("Failed to save Posts: \(String(describing: error?.localizedDescription))")
            }
        }
        
        
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
