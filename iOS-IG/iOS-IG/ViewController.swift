//
//  ViewController.swift
//  iOS-IG
//
//  Created by Harsha Goli on 10/31/16.
//  Copyright © 2016 Harsha Goli. All rights reserved.
//

import UIKit

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
