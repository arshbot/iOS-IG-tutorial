//
//  AddLocationViewController.swift
//  iOS-IG
//
//  Created by Harsha Goli on 11/14/16.
//  Copyright © 2016 Harsha Goli. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    lazy var addLocationButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add Location", for: .normal)
        btn.addTarget(self, action: #selector(addLocation), for: .touchUpInside)
        // btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func addLocation() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let location = Location(context: context)
        
        location.name = "Location Example"
        location.timestamp = Double(NSDate().timeIntervalSince1970)
        location.xcoordinate = -33.86
        location.ycoordinate = 151.26
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(addLocationButton)
        
        addLocationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addLocationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addLocationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        addLocationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
