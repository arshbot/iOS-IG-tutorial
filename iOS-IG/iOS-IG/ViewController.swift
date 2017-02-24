//
//  ViewController.swift
//  iOS-IG
//
//  Created by Harsha Goli on 10/31/16.
//  Copyright © 2016 Harsha Goli. All rights reserved.
//

import UIKit
import GoogleMaps //If this isn't here, everything breaks for some reason ¯\_(ツ)_/¯
import CoreData

//IMPORTANT: Make sure your Info.plist looks like this before running! https://imgur.com/gallery/6SI0D
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var tv: UITableView!
    
    //Now we replace the dummy GPS data with actual GPS data! Hooray!
    var GPSData:[CLLocation] = []
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        GPSData.append(contentsOf: locations)
        tv.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GPSData.count-1
    }
    
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
