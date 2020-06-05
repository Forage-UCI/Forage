//
//  PrivacyViewController.swift
//  Forage
//
//  Created by Maha Malik on 6/1/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let sections: [String] = ["Name", "Email", "Phone Number"]
    let s1data: [String] = ["John Doe"]
    let s2data: [String] = ["johndoe@example.com"]
    let s3data: [String] = ["(123) 456-7869"]
    //let variables = ["John Doe", "johndoe@example.com", "(123) 456-7869"]
    
    var sectionData: [Int:[String]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        sectionData = [0: s1data, 1: s2data, 2: s3data]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyCell", for: indexPath ) as! PrivacyCell
        
        cell.label?.text = sectionData[indexPath.section]![indexPath.row]
        
        return cell
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
