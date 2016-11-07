//
//  ViewController.swift
//  iOS-IG
//
//  Created by Harsha Goli on 10/31/16.
//  Copyright © 2016 Harsha Goli. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //IB outlet created by option + dragging from storyboard to this file
    @IBOutlet weak var tv: UITableView!
    
    //Dummy time data, DON'T EVER DO THIS IN PRODUCTION
    var dummyTime: [String] = [
        "0000",
        "1:11",
        "2:22",
        "3:33",
        "4:44",
        "5:55",
        "6:66",
        "7:77",
        "8:88",
        "9:99"
    ]
    
    //Dummy GPS Data. It literally does not matter what is here, just to prove that data can be drawn
    var dummyGPS = [
        000,
        111,
        222,
        333,
        444,
        555,
        666,
        777,
        888,
        999
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tv.delegate = self
        tv.dataSource = self
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - tv.bounds.height), camera: camera)
        mapView.isMyLocationEnabled = true
        
        //Now that the mapView is created we need to staple it to our view correctly
        setupViews(mapView: mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    
    }
    
    func setupViews(mapView: UIView){
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: tv.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }


    //Rarely used
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returns number of cells, in this case 10
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //Constructs the cell using the cell class at the bottom and retunrs said cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.index.text = String(indexPath.row)
        cell.Time.text = dummyTime[indexPath.row]
        cell.GPS.text = String(dummyGPS[indexPath.row])
        
        return cell
    }
    
    //We'll use this later
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var index: UILabel!
    
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var GPS: UILabel!
}
