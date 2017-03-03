//
//  ViewController.swift
//  iOS-IG
//
//  Created by Harsha Goli on 10/31/16.
//  Copyright © 2016 Harsha Goli. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv.delegate = self
        tv.dataSource = self
            
    }
    
    //Returns number of cells, in this case 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //Constructs the cell using the cell class at the bottom and retunrs said cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.index.text = "TEST"
        let date = NSDate()
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        cell.Time.text = "\(hour):\(minutes)"
        cell.GPS.text = "Latitude probs"
    
        return cell
    }
    
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var index: UILabel!
    
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var GPS: UILabel!
}
