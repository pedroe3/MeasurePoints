//
//  MapViewController.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 5/19/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let appData = AppData.shared
    var points = [MeasurePointClass]()
    
    @IBOutlet weak var mapVIew: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        setupInitialMap()
    }
}

extension MapViewController {
    
    func setupInitialMap() {
        
        let latitude: Double = 18.2342
        let longitude: Double = -66.4108
        
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        let regionRadius: CLLocationDistance = 30000

        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        self.mapVIew.setRegion(coordinateRegion, animated: true)
        
        for loc in appData.measurePointList {
            let point = MeasurePointClass(title: loc.SiteNumber,
                                          locationName: loc.StationName,
                                          discipline: "Measure Point",
                                          coordinate: CLLocationCoordinate2D(latitude: Double(loc.Latitude)!, longitude: Double(loc.Longitude)!))
            points.append(point)
        }
        self.mapVIew.addAnnotations(points)
    }
}
