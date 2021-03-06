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

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = UIColor.bondi
        }
    }
    
    @IBOutlet weak var caseNumberLabel: UILabel! {
        didSet {
            caseNumberLabel.textColor = UIColor.marina
        }
    }
    
    @IBOutlet weak var inventoryDate: UILabel! {
        didSet {
            inventoryDate.textColor = UIColor.marina
        }
    }
    
    @IBOutlet weak var mapInCell: MKMapView!
    
    
    @IBOutlet weak var favoriteImage: UIImageView!
    
    func configureCell(with measurePoint: MeasurePoint) {
        
        self.nameLabel?.text = "Site Number: " + measurePoint.SiteNumber
        self.caseNumberLabel.text = "Inventory: \(measurePoint.InventoryDate)"
        self.inventoryDate.text = measurePoint.StationName
        self.contentView.backgroundColor = UIColor.glass
        //let disclousure = UITableViewCellAccessoryType.disclosureIndicator
        //self.accessoryType = disclousure
        
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
            favoriteImage.image = #imageLiteral(resourceName: "favorites_icon_40pt")
        } else {
            favoriteImage.image = nil
        }
    }
    
    
}


