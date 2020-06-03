//
//  CheckInViewController.swift
//  Forage
//
//  Created by Yanjie Xu on 2020/6/3.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

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
        
        RestNameLable.text = restName
        
        var address: String = ""
        for str in formattedAddress{
            address = address + str + " "
        }
        
        AddressLabel.text = address
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
