//
//  MeasurePointTableViewCell.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit
import MapKit

class MeasurePointTableViewCell: UITableViewCell  {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var caseNumberLabel: UILabel!
    
    @IBOutlet weak var inventoryDate: UILabel!
    
    @IBOutlet weak var mapInCell: MKMapView!
    
    
    func configureCell(with measurePoint: MeasurePoint) {
        
        self.nameLabel?.text = "Site Number: " + measurePoint.SiteNumber
        self.caseNumberLabel.text = "Inventory: \(measurePoint.InventoryDate)"
        self.inventoryDate.text = measurePoint.StationName
        
        let disclousure = UITableViewCellAccessoryType.disclosureIndicator
        self.accessoryType = disclousure
        
    }
    
    func configureMap(with measurePoint: MeasurePoint) {
        
        let initialLocation = CLLocation(latitude: Double(measurePoint.Latitude)!, longitude: Double(measurePoint.Longitude)!)
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        self.mapInCell.setRegion(coordinateRegion, animated: false)
        let point = MeasurePointClass(title: measurePoint.SiteNumber,
                                      locationName: measurePoint.StationName,
                                      discipline: "Measure Point",
                                      coordinate: CLLocationCoordinate2D(latitude: Double(measurePoint.Latitude)!, longitude: Double(measurePoint.Longitude)!))
        
        self.mapInCell.addAnnotation(point)
    }
    
    
}


