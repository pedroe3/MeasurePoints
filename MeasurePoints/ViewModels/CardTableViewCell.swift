//
//  CardTableViewCell.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/26/18.
//  Copyright © 2018 madcrow. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var inventoryLabel: UILabel! {
        didSet {
            inventoryLabel.textColor = UIColor.marina
        }
    }
    @IBOutlet weak var caseNumberLabel: UILabel! {
        didSet {
            caseNumberLabel.textColor = UIColor.marina
        }
    }
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.textColor = UIColor.bondi
        }
    }
    
    @IBOutlet weak var favoriteButton: UIButton! {
        didSet {
            //favoriteButton.apply(ButtonStyle.standard, with: "Add to Favorites")
        }
    }
    
    
    func configureCell(with measurePoint: MeasurePoint) {
        self.nameLabel?.text = "Site Number: " + measurePoint.SiteNumber
        self.caseNumberLabel.text = "Inventory: \(measurePoint.InventoryDate)"
        self.inventoryLabel.text = measurePoint.StationName
        self.contentView.backgroundColor = UIColor.glass
    }
    
    func configureMap(with measurePoint: MeasurePoint) {
        setFavoriteImage(measurePoint)
        let initialLocation = CLLocation(latitude: Double(measurePoint.Latitude)!, longitude: Double(measurePoint.Longitude)!)
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: false)
        let point = MeasurePointClass(title: measurePoint.SiteNumber,
                                      locationName: measurePoint.StationName,
                                      discipline: "Measure Point",
                                      coordinate: CLLocationCoordinate2D(latitude: Double(measurePoint.Latitude)!, longitude: Double(measurePoint.Longitude)!))
        
        self.mapView.addAnnotation(point)
    }
    
    func setFavoriteImage(_ measurePoint: MeasurePoint){
        if(measurePoint.isFavorite!){
            //favoriteButton.apply(ButtonStyle.standard, with: "Favorite")
             //favoriteImage.image = #imageLiteral(resourceName: "favorites_icon_40pt")
        } else {
           // favoriteButton.apply(ButtonStyle.standard, with: "Add")
            // favoriteImage.image = nil
        }
    }
}
