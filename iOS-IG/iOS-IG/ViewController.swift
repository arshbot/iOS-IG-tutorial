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

    //IB outlet created by option + dragging from storyboard to this file
    @IBOutlet weak var tv: UITableView!
    
    //Dummy GPS Data. It literally does not matter what is here, just to prove that data can be drawn
    var GPSData:[CLLocation] = []
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the delegate for the tableview objects as self, or this object
        tv.delegate = self
        tv.dataSource = self
        
        //Requesting authrization from the user before implementing locationManager
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        //Setting delegates and starting the GPS
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        
        //Defining the mapView object and initing it to the current screen size
        
        //Settings anchors for the mapView object
        
        // Creates a marker in Sydney for some reason
    
    }
    let path = GMSMutablePath()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        GPSData.append(contentsOf: locations)
        tv.reloadData()
    }
    
    //Returns number of cells, in this case 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GPSData.count-1
    }
    
    //Constructs the cell using the cell class at the bottom and retunrs said cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.index.text = String(indexPath.row)
        let date = NSDate()
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        cell.Time.text = "\(hour):\(minutes)"
        cell.GPS.text = String(describing: GPSData.reversed()[indexPath.row].coordinate.latitude)
    
        return cell
    }
    
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var index: UILabel!
    
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var GPS: UILabel!
}
