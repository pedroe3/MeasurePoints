//
//  DesignTableViewCell.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/25/18.
//  Copyright © 2018 madcrow. All rights reserved.
//

import UIKit
import MapKit

class DesignTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var caseNumberLabel: UILabel!
    
    @IBOutlet weak var inventoryDate: UILabel!
    
    @IBOutlet weak var mapInCell: MKMapView!
    
    @IBOutlet weak var addToFavoriteButton: UIButton!
    

    func configureCell(with measurePoint: MeasurePoint) {
        self.nameLabel?.text = "Site Number: " + measurePoint.SiteNumber
        self.caseNumberLabel.text = "Inventory: \(measurePoint.InventoryDate)"
        self.inventoryDate.text = measurePoint.StationName
    }
    
    func configureMap(with measurePoint: MeasurePoint) {
        setFavoriteImage(measurePoint)
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
    
    func setFavoriteImage(_ measurePoint: MeasurePoint){
        if(measurePoint.isFavorite!){
           // favoriteImage.image = #imageLiteral(resourceName: "favorites_icon_40pt")
        } else {
           // favoriteImage.image = nil
        }
    }
    
    
    
    
}
